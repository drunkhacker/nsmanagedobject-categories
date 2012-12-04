//
//  NSManagedObject+FindMethods.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (FindMethods)
+ (NSArray *)findWithPredicate:(id)stringOrPredicate, ...;
+ (NSArray *)findWithPredicate:(NSPredicate *)pred andSortDescriptor:(NSSortDescriptor *)descriptor;
+ (NSArray *)findWithPredicate:(NSPredicate *)pred sortDescriptor:(NSSortDescriptor *)descriptor andFetchLimit:(NSUInteger)limit;
@end
