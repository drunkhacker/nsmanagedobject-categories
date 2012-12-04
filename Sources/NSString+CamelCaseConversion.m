//
//  NSString+CamelCaseConversion.m
//  Sample
//
//  Created by Jaehwa Han on 12/4/12.
//  Copyright (c) 2012 Jaehwa Han. All rights reserved.
//

#import "NSString+CamelCaseConversion.h"
#import "RegexKitLite.h"

@implementation NSString (CamelCaseConversion)
- (NSString *)toCamelCase
{
    return [self stringByReplacingOccurrencesOfRegex:@"_([a-zA-Z0-9]+)" usingBlock:^NSString *(NSInteger captureCount, NSString * const capturedStrings[captureCount], const NSRange capturedRanges[captureCount], volatile BOOL * const stop) {
        return [capturedStrings[1] capitalizedString];
    }];
}

- (NSString *)toUnderscore
{
    return [self stringByReplacingOccurrencesOfRegex:@"[A-Z]" usingBlock:^NSString *(NSInteger captureCount, NSString * const capturedStrings[captureCount], const NSRange capturedRanges[captureCount], volatile BOOL * const stop) {
        unichar cs[2] = {(unichar)'_', [capturedStrings[0] characterAtIndex:0] + 32};
        return [NSString stringWithCharacters:cs length:2];
    }];
}

@end
