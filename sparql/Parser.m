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
@synthesize tokens, tree;

- (id)initWithTokens:(id)initTokens {
    self = [super init];
    if (self != nil) {
        tokens = [NSMutableArray arrayWithArray:initTokens];
        tree = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)parseTokens {
    return [self query:tokens];
}

- (id)query:(id)queryTokens {
    id token = [queryTokens objectAtIndex:0];
    [queryTokens removeObjectAtIndex:0];
    if ([Prefix isPrefixToken:token]) {
        // treeが空か、prefixがすでに存在していない場合
        if ([tree count] == 0 || ([tree count] > 0 && ![[tree objectAtIndex:0] isMemberOfClass:[Prefix class]])) {
                [tree addObject:[[Prefix alloc] initWithTokens:[NSMutableArray arrayWithArray:queryTokens]]];
        }
    } else if ([Select isSelectToken:token]) {
        [tree addObject:[[Select alloc] initWithTokens:[NSMutableArray arrayWithArray:queryTokens]]];
    }
    
    if ([queryTokens count] > 0) [self query:queryTokens];
    return tree;
}

@end
