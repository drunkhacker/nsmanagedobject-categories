//
//  NSManagedObject+Delete.m
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import "NSManagedObject+Delete.h"
#import "NSManagedObjectContextHolder.h"

@implementation NSManagedObject (Delete)
- (BOOL)delete:(NSError **)err
{
    NSManagedObjectContext *context = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    [context deleteObject:self];
    return [context save:err];
}

@end
