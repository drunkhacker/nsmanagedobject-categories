//
//  NSManagedObjectContext+OnelineFetch.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//
//  Original one :
//  http://www.cocoawithlove.com/2008/03/core-data-one-line-fetch.html
//  Here, I changed NSSet to NSArray for convenience

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (OnelineFetch)
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(id)stringOrPredicate, ...;
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(NSPredicate *)predicate andSortDescriptor:(NSSortDescriptor *)descriptor;
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(NSPredicate *)predicate sortDescriptor:(NSSortDescriptor *)descriptor andFetchLimit:(NSUInteger)limit;
- (NSUInteger)countObjectForEntityName:(NSString *)newEntityName withPredicate:(id)stringOrPredicate, ...;
@end
