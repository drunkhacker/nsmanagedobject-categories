//
//  NSManagedObject+FindMethods.m
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import "NSManagedObject+FindMethods.h"
#import "NSManagedObjectContext+OnelineFetch.h"
#import "NSManagedObjectContextHolder.h"

@implementation NSManagedObject (FindMethods)
+ (id)findOneWithPredicate:(id)stringOrPredicate, ...
{
    NSManagedObjectContext *ctx = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSPredicate *predicate = nil;
    
    if (stringOrPredicate)
    {
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
    }
    
    NSArray *a = [ctx fetchObjectsForEntityName:NSStringFromClass([self class]) withPredicate:predicate];
    return a.count == 0 ? nil : a[0];
}

+ (NSArray *)findWithPredicate:(id)stringOrPredicate, ...
{
    NSManagedObjectContext *ctx = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSPredicate *predicate = nil;

    if (stringOrPredicate)
    {
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
    }

    return [ctx fetchObjectsForEntityName:NSStringFromClass([self class]) withPredicate:predicate];
}

+ (NSArray *)findWithPredicate:(NSPredicate *)pred andSortDescriptor:(NSSortDescriptor *)descriptor {
    NSManagedObjectContext *ctx = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    return [ctx fetchObjectsForEntityName:NSStringFromClass([self class]) withPredicate:pred andSortDescriptor:descriptor];

}

+ (NSArray *)findWithPredicate:(NSPredicate *)pred sortDescriptor:(NSSortDescriptor *)descriptor andFetchLimit:(NSUInteger)limit {
    NSManagedObjectContext *ctx = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    return [ctx fetchObjectsForEntityName:NSStringFromClass([self class]) withPredicate:pred sortDescriptor:descriptor andFetchLimit:limit];
}

@end
