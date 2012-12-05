//
//  NSManagedObject+Save.m
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import "NSManagedObject+Save.h"
#import "NSManagedObjectContextHolder.h"

@implementation NSManagedObject (Save)
- (BOOL)save:(NSError **)err
{
    
    NSManagedObjectContext *context = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    return [context save:err];
}
@end
