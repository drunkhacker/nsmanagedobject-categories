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
    NSError *err2;
    BOOL f = [context save:&err2];
    
    if (!f) {
        NSLog(@"err = %@", err2.description);
    }
    
    return f;
}
@end
