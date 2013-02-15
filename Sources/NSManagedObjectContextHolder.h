//
//  NSManagedObjectContextHolder.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSManagedObjectContextHolder <NSObject>
- (NSManagedObjectContext *)managedObjectContext;
- (NSManagedObjectContext *)tempManagedObjectContext;
@end
