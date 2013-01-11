//
//  NSManagedObject+TemporaryObject.m
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import "NSManagedObject+TemporaryObject.h"
#import "NSManagedObjectContextHolder.h"
#import "NSManagedObject+FromDictionary.h"

@implementation NSManagedObject (TemporaryObject)
+ (id)temporaryObject {
    id<NSManagedObjectContextHolder> holder = (id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *ctx = [holder managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:ctx];
    
    return [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
}

+ (id)temporaryObjectWithDictionary:(NSDictionary *)dict
{
    id obj = [self temporaryObject];
    [obj updateWithDictionary:dict];
    return obj;
}

- (id)temporaryObject
{
    id<NSManagedObjectContextHolder> holder = (id<NSManagedObjectContextHolder>)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *ctx = [holder managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:NSStringFromClass([self class]) inManagedObjectContext:ctx];
    NSManagedObject *obj = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
    
    [obj setValuesForKeysWithDictionary:[self dictionaryWithValuesForKeys:[entity attributesByName].allKeys]];
    return obj;
}

@end
