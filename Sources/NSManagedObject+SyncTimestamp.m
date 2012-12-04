//
//  NSManagedObject+SyncTimestamp.m
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import "NSManagedObject+SyncTimestamp.h"
#import "NSManagedObjectContextHolder.h"
#import "NSManagedObjectContext+OnelineFetch.h"

@implementation NSManagedObject (SyncTimestamp)
+ (long)lastDataVersion {
    return [self lastDataVersionForName:NSStringFromClass([self class])];
}

+ (void)markAsLatest {
    [self markAsLatestForName:NSStringFromClass([self class])];
}

+ (long)lastDataVersionForName:(NSString *)modelName
{
    NSManagedObjectContext *context = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSArray *arr = [context fetchObjectsForEntityName:@"DataVersion" withPredicate:@"modelName == %@", modelName];
    id dv = arr.count == 0 ? nil : arr[0];
    
    return [[dv valueForKey:@"timestamp"] longValue];
}

+ (void)markAsLatestForName:(NSString *)modelName
{
    NSManagedObjectContext *context = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSArray *arr = [context fetchObjectsForEntityName:@"DataVersion" withPredicate:@"modelName == %@", modelName];
    id dv = arr.count == 0 ? nil : arr[0];
    
    if (dv) {
        [dv setValue:@((long)[[NSDate date] timeIntervalSince1970]) forKey:@"timestamp"];
        [dv setValue:modelName forKey:@"modelName"];
        NSError *error;
        if (![context save:&error]) {
            @throw error.description;
        }
    } else {
        dv = [NSEntityDescription insertNewObjectForEntityForName:@"DataVersion" inManagedObjectContext:context];
        [dv setValue:@((long)[[NSDate date] timeIntervalSince1970]) forKey:@"timestamp"];
        [dv setValue:modelName forKey:@"modelName"];
        NSError *error;
        if (![context save:&error]) {
            @throw error.description;
        }
    }
}

@end
