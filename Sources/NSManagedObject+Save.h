//
//  NSManagedObject+Save.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Save)
- (BOOL)save:(NSError **)err;
@end
