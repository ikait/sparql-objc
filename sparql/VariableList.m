//
//  VariableList.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "VariableList.h"

@implementation VariableList
@synthesize list;

- (id)initWithTokens:(id)tokens {
    self = [super init];
    if (self) {
        list = [self createVariableList:tokens List:nil];
    }
    return self;
}

- (id)toString {
    return [NSMutableString stringWithFormat:
            @"%@%@%@",
            @"(",
            [list componentsJoinedByString:@","],
            @")"];
}

- (bool)isVariable:(id)token {
    id str = [token toString];
    return [str hasPrefix:@"?"] || [str hasPrefix:@"$"] || [str hasPrefix:@"*"];
}

- (bool)hasNext:(id)tokens {
    return [tokens count] > 0 && [tokens objectAtIndex:0] && [self isVariable:[tokens objectAtIndex:0]];
}

- (id)createVariableList:(id)tokens List:(id)l {
    id variableList = (l != nil) ? l : [NSMutableArray array];
    if ([tokens count] > 0) {
        if ([self isVariable:[tokens objectAtIndex:0]]) {
            [variableList addObject:[[Variable alloc] initWithToken:[tokens objectAtIndex:0]]];
            [tokens removeObjectAtIndex:0];
            if ([self hasNext:tokens]) {
                [self createVariableList:tokens List:variableList];
            }
        }
    }
    return variableList;
}

@end
