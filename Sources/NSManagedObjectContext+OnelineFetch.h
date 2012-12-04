//
//  NSManagedObjectContext+OnelineFetch.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (OnelineFetch)
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(id)stringOrPredicate, ...;
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(NSPredicate *)predicate andSortDescriptor:(NSSortDescriptor *)descriptor;
- (NSArray *)fetchObjectsForEntityName:(NSString *)newEntityName withPredicate:(NSPredicate *)predicate sortDescriptor:(NSSortDescriptor *)descriptor andFetchLimit:(NSUInteger)limit;
@end
