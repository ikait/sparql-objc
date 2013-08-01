//
//  Select.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Select.h"
#import "Token.h"
#import "VariableList.h"
#import "GraphPattern.h"

@implementation Select

+ (bool)isSelectToken:(id)token {
    return [Token isToken:token] && [token belongsTo:[NSNumber numberWithInt:SYMBOL]] && [self testTokenString:token];
}

- (id)initWithToken:(id)tokens {
    self = [super init];
    variables = [self extractGraphPatterns:tokens];
    if ([self hasWhereClause:tokens]) {
        [tokens removeObjectAtIndex:0];
        graphpatterns = [self extractGraphPatterns:tokens];
    }
    return self;
};

- (NSString *)toString {
    id str = [NSMutableString stringWithString:@""];
    [str appendString:@"(select "];
    [str appendString:[variables toString]];
    [str appendString:[graphpatterns toString]];
    [str appendString:@")"];
    return str;
}


+ (bool)testTokenString:(id)token {
    id str = [token string];
    return [str isEqualToString:@"string"];
}

- (id)extractVariable:(id)tokens {
    return [[VariableList alloc] initWithTokens:tokens];
}

- (id)extractGraphPatterns:(id)tokens {
    return [[GraphPattern alloc] init];
}

- (bool)hasWhereClause:(id)tokens {
    return [tokens count] > 0 && tokens != nil && [[[tokens objectAtIndex:0] string] isEqualToString:@"where"];
}

@end
