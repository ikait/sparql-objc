//
//  Select.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Select.h"

//
// 文法
// http://www.asahi-net.or.jp/~ax2s-kmtn/internet/rdf/rdf-sparql-query.html#sparqlGrammar
//

@implementation Select

+ (BOOL)isSelectToken:(id)token {
    return [Token isToken:token] && [token belongsTo:[NSNumber numberWithInt:SYMBOL]] && [self testTokenString:token];
}

- (id)initWithTokens:(id)tokens {
    self = [super init];
    variables = [self extractVariable:tokens];
    if ([self hasWhereClause:tokens]) {
        [tokens removeObjectAtIndex:0];
        graphpatterns = [self extractGraphPatterns:tokens];
    }
    return self;
};

- (NSString *)toString {
    return [NSMutableString stringWithFormat:@"%@%@%@%@",
            @"(select ",
            [variables toString],
            [graphpatterns toString],
            @")"];
}


+ (BOOL)testTokenString:(id)token {
    id str = [[token toString] lowercaseString];
    return [str isEqualToString:@"select"];
}

- (id)extractVariable:(id)tokens {
    return [[VariableList alloc] initWithTokens:tokens];
}

- (id)extractGraphPatterns:(id)tokens {
    return [[GraphPattern alloc] initWithTokens:tokens];
}

- (BOOL)hasWhereClause:(id)tokens {
    return [tokens count] > 0
    && tokens != nil
    && ([[[[tokens objectAtIndex:0] toString] lowercaseString] isEqualToString:@"where"] || [[[[tokens objectAtIndex:0] toString] lowercaseString] isEqualToString:@"{"]);
}

@end
