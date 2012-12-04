//
//  NSManagedObject+FromDictionary.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (FromDictionary)
- (void)updateWithDictionary:(NSDictionary *)dict;
+ (id)insertWithDictionary:(NSDictionary *)dict error:(NSError **)error;
+ (id)insertWithDictionary:(NSDictionary *)dict uniqueKey:(NSString *)key error:(NSError **)error;
+ (id)updateWithDictionary:(NSDictionary *)dict uniqueKey:(NSString *)key error:(NSError **)error;
+ (id)updateWithDictionary:(NSDictionary *)dict uniqueKey:(NSString *)key upsert:(BOOL)upsert error:(NSError **)error;
@end
