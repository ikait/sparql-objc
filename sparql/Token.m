//
//  Token.m
//  sparql
//
//  Created by Taishi Ikai on 2013/06/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Token.h"

@implementation Token

@synthesize str, type;

- (id)initWithString:(NSString *)q type:(id)t {
    self = [super init];
    if (self != nil) {
        self.str = q;
        self.type = t;
    }
    return self;
}

- (NSString *)toString {
    return str;
}

- (BOOL)belongsTo:(id)t {
    return [self.type isEqualToString:t];
}

+ (BOOL)isToken:(id)obj {
    return [obj isKindOfClass:[Token class]];
}

@end
