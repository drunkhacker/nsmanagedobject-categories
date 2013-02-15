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

+ (void)markTime:(long)ts {
    [self markTime:ts forName:NSStringFromClass([self class])];
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

+ (void)markTime:(long)ts forName:(NSString *)modelName
{
    NSManagedObjectContext *context = [(id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSArray *arr = [context fetchObjectsForEntityName:@"DataVersion" withPredicate:@"modelName == %@", modelName];
    id dv = arr.count == 0 ? nil : arr[0];
    
    if (dv) {
        [dv setValue:@(ts) forKey:@"timestamp"];
        [dv setValue:modelName forKey:@"modelName"];
        NSError *error;
        if (![context save:&error]) {
            @throw error.description;
        }
    } else {
        dv = [NSEntityDescription insertNewObjectForEntityForName:@"DataVersion" inManagedObjectContext:context];
        [dv setValue:@(ts) forKey:@"timestamp"];
        [dv setValue:modelName forKey:@"modelName"];
        NSError *error;
        if (![context save:&error]) {
            @throw error.description;
        }
    }

}

+ (void)markAsLatestForName:(NSString *)modelName
{
    [self markTime:(long)([[NSDate date] timeIntervalSince1970]) forName:modelName];
}

@end
