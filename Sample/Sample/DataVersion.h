//
//  DataVersion.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface DataVersion : NSManagedObject

@property (nonatomic, retain) NSString * modelName;
@property (nonatomic, retain) NSNumber * timestamp;

@end
