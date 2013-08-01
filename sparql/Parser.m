//
//  Parser.m
//  sparql
//
//  Created by Taishi Ikai on 2013/07/28.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Parser.h"
#import "Select.h"

@implementation Parser

@synthesize tokens;

- (id)initWithTokens:(id)initTokens {
    self = [super init];
    if (self != nil) {
        self->tokens = [NSMutableArray arrayWithArray:initTokens];
    }
    return self;
}

- (id)parseTokens {
    return [self query:tokens];
}

- (id)query:(id)queryTokens {
    id token = [queryTokens objectAtIndex:0];
    [queryTokens removeObjectAtIndex:0];
    if ([Select isSelectToken:token]) {
        return [[Select alloc] initWithToken:token];
    }
    return nil;
}

@end
