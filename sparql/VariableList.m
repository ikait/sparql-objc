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
    id elms = [list componentsJoinedByString:@","];
    id str = [NSMutableString string];
    [str appendString:@"("];
    [str appendString:elms];
    [str appendString:@")"];
    return str;
}

- (bool)isVariable:(id)token {
    id firstCharacter = [[token string] substringWithRange:NSMakeRange(0, 1)];
    return [firstCharacter isEqualToString:@"?"] || [firstCharacter isEqualToString:@"$"];
}

- (bool)hasNext:(id)tokens {
    return [tokens count] > 0 && [tokens objectAtIndex:0] && [[[tokens objectAtIndex:0] string] isEqualToString:@","];
}

- (id)createVariableList:(id)tokens List:(id)l {
    id variableList = (l != nil) ? l : [NSMutableArray array];
    if ([tokens count] > 0) {
        if ([self isVariable:[tokens objectAtIndex:0]]) {
            [variableList addObject:[[Variable alloc] initWithToken:[tokens objectAtIndex:0]]];
            [tokens removeObjectAtIndex:0];
            if ([self hasNext:tokens]) {
                [tokens removeObjectAtIndex:0];
                [self createVariableList:tokens List:variableList];
            }
        }
    }
    return variableList;
}

@end
