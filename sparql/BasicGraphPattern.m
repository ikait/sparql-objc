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
    id str = [NSMutableString stringWithString:@""];
    [str appendString:@"(bgp "];
    [str appendString:[triples componentsJoinedByString:@","]];
    [str appendString:@")"];
    return str;
}

- (bool)isTokenValue:(id)tokens Value:(id)value Index:(id)index {
    // id idx = (index != nil) ? index : 0;
    return [tokens count] > 0 && [tokens objectAtIndex:0] && [[[tokens objectAtIndex:0] string] isEqualToString:value];
}

- (bool)terminated:(id)tokens {
    return [self isTokenValue:tokens Value:@"}" Index:nil];
}

- (id)extractTriples:(id)tokens {
    id list = [NSMutableArray array];
    id subject = nil;
    
    while (![self terminated:tokens]) {
        subject = (subject != nil) ? subject : [tokens objectAtIndex:0];
        [tokens removeObjectAtIndex:0];
        id predicate = [tokens objectAtIndex:0];
        [tokens removeObjectAtIndex:0];
        id object = [tokens objectAtIndex:0];
        [tokens removeObjectAtIndex:0];
        
        [list addObject:[[Triple alloc] initWithSubject:subject Predicate:predicate Object:object]];
        
        if ([self isTokenValue:tokens Value:@";" Index:nil]) {
            subject = nil;
        }
        [tokens removeObjectAtIndex:0];
    }
    [tokens removeObjectAtIndex:0];
    return list;
}

@end
