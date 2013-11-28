//
//  GraphPattern.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "GraphPattern.h"
#import "VariableList.h"
#import "BasicGraphPattern.h"

@implementation GraphPattern

@synthesize graphs;

- (id)initWithTokens:(id)tokens {
    self = [super init];
    if (self) {
        graphs = [self extractGraphs:tokens List:nil];
    }
    return self;
}

- (id)toString {
    return [NSMutableString stringWithFormat:
            @"%@%@%@",
            @"(",
            [graphs componentsJoinedByString:@","],
            @")"];
}

- (BOOL)hasNext:(id)tokens {
    return false;  // XXX
}

- (id)extractGraphs:(id)tokens List:(id)_list {
    id list = (_list) ? _list : [NSMutableArray array];
    [list addObject:[[BasicGraphPattern alloc] initWithTokens:tokens]];
    if ([self hasNext:tokens]) {
        [self extractGraphs:tokens List:list];
    }
    return list;
}

@end

