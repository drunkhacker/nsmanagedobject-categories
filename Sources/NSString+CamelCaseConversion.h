//
//  NSString+CamelCaseConversion.h
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CamelCaseConversion)
- (NSString *)toCamelCase;
- (NSString *)toUnderscore;

@end
