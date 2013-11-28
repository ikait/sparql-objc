//
//  Labellist.m
//  sparql
//
//  Created by Taishi Ikai on 2013/11/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "LabelList.h"

@implementation LabelList
@synthesize list;

- (id)initWithTokens:(id)tokens {
    self = [super init];
    if (self) {
        list = [self createLabelList:tokens List:nil];
    }
    return self;
}

- (NSString *)toString {
    return [NSMutableString stringWithFormat:
            @"%@%@%@",
            @"(",
            [list componentsJoinedByString:@","],
            @")"];
}

- (id)createLabelList:(id)tokens List:(id)l {
    id labelList = (l != nil) ? l : [NSMutableArray array];
    if ([tokens count] > 1) {
        if ([self isLabel:[tokens objectAtIndex:0]] &&
            [self isURI:[tokens objectAtIndex:1]]) {
            [labelList addObject:[[Label alloc] initWithToken:[tokens objectAtIndex:0] URIToken:[tokens objectAtIndex:1]]];
            [tokens removeObjectAtIndex:0];  // label:
            [tokens removeObjectAtIndex:0];  // <uri>
            if ([self hasNext:tokens]) {
                [tokens removeObjectAtIndex:0];  // prefix
                [self createLabelList:tokens List:labelList];
            }
        }
    }
    return labelList;
}

- (BOOL)isLabel:(Token *)token {
    id str = [token toString];
    return [str hasSuffix:@":"];
}

- (BOOL)isURI:(Token *)token {
    id str = [token toString];
    return [str hasPrefix:@"<"] && [str hasSuffix:@">"] && [token type] == [NSNumber numberWithInt:URI];
}

- (BOOL)hasNext:(id)tokens {
    // PREFIXであれば次へ
    return [Prefix testTokenString:[tokens objectAtIndex:0]];
}




@end
