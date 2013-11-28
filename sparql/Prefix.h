//
//  Prefix.h
//  sparql
//
//  Created by Taishi Ikai on 2013/11/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"
#import "LabelList.h"

@class Token;

@interface Prefix : NSObject
@property id namespaces;

+ (BOOL)isPrefixToken:(id)token;
+ (BOOL)testTokenString:(id)token;

- (id)initWithTokens:(id)tokens;
- (NSString *)toString;

@end
