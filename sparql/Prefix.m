//
//  Prefix.m
//  sparql
//
//  Created by Taishi Ikai on 2013/11/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Prefix.h"

@implementation Prefix
@synthesize namespaces;

+ (BOOL)isPrefixToken:(id)token {
    return [Token isToken:token] && [token belongsTo:[NSNumber numberWithInt:SYMBOL]] && [self testTokenString:token];
}

- (id)initWithTokens:(id)tokens {
    self = [super init];
    namespaces = [self extractLabel:tokens];
    return self;
}

- (NSString *)toString {
    return @"";
}

+ (BOOL)testTokenString:(id)token {
    id str = [[token toString] lowercaseString];
    return [str isEqualToString:@"prefix"];
}

- (id)extractLabel:(id)tokens {
    return [[LabelList alloc] initWithTokens:tokens];
}



@end
