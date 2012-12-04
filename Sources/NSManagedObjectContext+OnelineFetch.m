//
//  NSManagedObjectContext+OnelineFetch.m
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//
//  Original one :
//  http://www.cocoawithlove.com/2008/03/core-data-one-line-fetch.html
//  Here, I changed NSSet to NSArray for convenience

#import "NSManagedObjectContext+OnelineFetch.h"

@implementation NSManagedObjectContext (OnelineFetch)
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(id)stringOrPredicate, ...
{
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:newEntityName inManagedObjectContext:self];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    if (stringOrPredicate)
    {
        NSPredicate *predicate;
        if ([stringOrPredicate isKindOfClass:[NSString class]])
        {
            va_list variadicArguments;
            va_start(variadicArguments, stringOrPredicate);
            predicate = [NSPredicate predicateWithFormat:stringOrPredicate
                                               arguments:variadicArguments];
            va_end(variadicArguments);
        }
        else
        {
            NSAssert2([stringOrPredicate isKindOfClass:[NSPredicate class]],
                      @"Second parameter passed to %s is of unexpected class %@",
                      sel_getName(_cmd), NSStringFromClass([stringOrPredicate class]));
            predicate = (NSPredicate *)stringOrPredicate;
        }
        [request setPredicate:predicate];
    }
    
    NSError *error = nil;
    NSArray *results = [self executeFetchRequest:request error:&error];
    if (error != nil)
    {
        [NSException raise:NSGenericException format:@"%@",[error description]];
    }
    
    return results;
    
}
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(NSPredicate *)predicate andSortDescriptor:(NSSortDescriptor *)descriptor
{
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:newEntityName inManagedObjectContext:self];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    
    if (predicate)
        [request setPredicate:predicate];
    if (descriptor)
        [request setSortDescriptors:@[descriptor]];
    
    NSError *error = nil;
    NSArray *results = [self executeFetchRequest:request error:&error];
    if (error != nil)
    {
        [NSException raise:NSGenericException format:@"%@",[error description]];
    }
    
    return results;
}

- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(NSPredicate *)predicate sortDescriptor:(NSSortDescriptor *)descriptor andFetchLimit:(NSUInteger)limit {
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:newEntityName inManagedObjectContext:self];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    [request setFetchLimit:limit];
    
    if (predicate)
        [request setPredicate:predicate];
    if (descriptor)
        [request setSortDescriptors:@[descriptor]];
    
    NSError *error = nil;
    NSArray *results = [self executeFetchRequest:request error:&error];
    if (error != nil)
    {
        [NSException raise:NSGenericException format:@"%@",[error description]];
    }
    
    return results;
}


@end
