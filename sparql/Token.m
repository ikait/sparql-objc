//
//  Token.m
//  sparql
//
//  Created by Taishi Ikai on 2013/06/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Token.h"

@implementation Token

@synthesize query, type;

- (id)initWithQuery:(NSString *)initQuery type:(id)initType {
    self = [super init];
    if (self != nil) {
        self.query = initQuery;
        self.type = initType;
    }
    return self;
}

- (NSString *)toString {
    return query;
}

- (BOOL)belongsTo:(id)btype {
    return [self.type isEqualTo:btype];
}

+ (BOOL)isToken:(id)obj {
    return [obj isKindOfClass:[Token class]];
}

@end
