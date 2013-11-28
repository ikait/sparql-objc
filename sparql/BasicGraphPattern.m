//
//  BasicGraphPattern.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "BasicGraphPattern.h"
#import "Triple.h"

@implementation BasicGraphPattern

- (id)initWithTokens:(id)tokens {
    self = [super init];
    triples = [self extractTriples:tokens];
    return self;
}

- (id)toString {
    id elms = [triples componentsJoinedByString:@","];
    return [NSMutableString stringWithFormat:@"%@%@%@", @"(bgp ", elms, @")"];
}

- (BOOL)isTokenValue:(id)tokens Value:(id)value Index:(NSUInteger)_index {
    return [tokens count] > _index && [tokens objectAtIndex:_index]&& [[[tokens objectAtIndex:_index] toString] isEqualToString:value];
}

- (BOOL)terminated:(id)tokens {
    return [self isTokenValue:tokens Value:@"}" Index:0];
}

- (id)extractTriples:(id)tokens {
    id list = [NSMutableArray array];
    id subject = nil;
    
    // WHERE省略時、すでに変数宣言に入っていた場合を考慮
    if ([self isTokenValue:tokens Value:@"{" Index:0]) {
        [tokens removeObjectAtIndex:0];
    }
    
    while (![self terminated:tokens]) {
        subject = (subject != nil) ? subject : [tokens objectAtIndex:0];
        [tokens removeObjectAtIndex:0];
        id predicate = [tokens objectAtIndex:0];
        [tokens removeObjectAtIndex:0];
        id object = [tokens objectAtIndex:0];
        [tokens removeObjectAtIndex:0];
        
        [list addObject:[[Triple alloc] initWithSubject:subject Predicate:predicate Object:object]];
        
        if ([self isTokenValue:tokens Value:@";" Index:0]) {  // ";"であれば2週目
//            subject = subject
        } else if ([self isTokenValue:tokens Value:@"." Index:0]) {  // "."があれば削除
            [tokens removeObjectAtIndex:0];
        }
        
    }
    // [tokens removeObjectAtIndex:0];  // "}"を削除
    return list;
}

@end
