//
//  Lexer.m
//  sparql
//
//  Created by Taishi Ikai on 2013/06/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Lexer.h"

@implementation Lexer


- (id)initWithQueryString:(NSString *)query {
    self = [super init];
    if (self != nil) {
        query_string = query;
        DELIMITER = @[@" ",
                           @"\n",
                           @"{",
                           @"}",
                           @".",
                           @";",
                           @","];
    }
    return self;
}

@synthesize query_string, tokens, current_position, DELIMITER;

+ (id)create:(id)query {
    return [[Lexer alloc] initWithQueryString:query];
}

+ (id)analyze:(id)query {
    id lexer = [Lexer create:query];
    return [lexer startlex];
}

- (id)startlex {
    if (tokens && [tokens count] > 0) {
        return tokens;
    }
    [self preProcess];
    [self proccess];
    [self postProccess];
    
    return self.tokens;
}

- (id)preProcess {
    current_position = 0;
    tokens = [[NSMutableArray alloc] init];
    return self;
}

- (id)postProccess {
    current_position = NSNotFound;
    return self;
}

- (id)proccess {
    if (current_position == NSNotFound) {
        [self preProcess];
    }
    while ([self hasNext]) {
        [self addToken];
    }
    return self;
}

- (BOOL)hasNext {
    return current_position < [query_string length];
}

- (id)getCurrentChar {
    if (query_string.length > current_position) {
        return [query_string substringWithRange:NSMakeRange(current_position, 1)];
    } else {
        return @"";
    }
}

- (BOOL)isDelimiter:(id)character delimiter:(id)delimiter {
    // Mutableも含めたいのでMemberOfでなくKindOf
    if ([delimiter isKindOfClass: [NSString class]]) {  
        return [character isEqualToString:delimiter];
    } else if (delimiter != nil && [delimiter isKindOfClass: [NSArray class]]) {
        return [delimiter indexOfObject:character] != NSNotFound;
    }
    return [DELIMITER indexOfObject:character] != NSNotFound;
}

- (BOOL) isCurrentCharDelimiter:(id)delimiter {
    return [self isDelimiter:[self getCurrentChar] delimiter:delimiter];
}

- (id) getLanguageTag {
    if (![[self getCurrentChar] isEqualToString:@"@"]) return @"";
    NSMutableString *buf = [self getCurrentChar];
    current_position++;
    [buf appendString:[self getTokenString:@""]];
    return buf;
}

- (id)getStringLiteral {
    if (![[self getCurrentChar] isEqualToString:@"\""]) return @"";
    
    NSMutableString *buf = [NSMutableString stringWithString:[self getCurrentChar]];
    current_position++;
    
    [buf appendString:[self getTokenString:@"\""]];
    
    [buf appendString:[self getCurrentChar]];
    current_position++;
    
    [buf appendString:[self getLanguageTag]];
    
    return buf;
}

- (id)getURLLiteral {
    if (![[self getCurrentChar] isEqualToString:@"<"]) {
        return @"";
    }
    
    NSMutableString *buf = [NSMutableString stringWithString:[self getCurrentChar]];
    current_position++;
    
    [buf appendString:[self getTokenString:@">"]];
    
    [buf appendString:[self getCurrentChar]];
    current_position++;
    
    return buf;
}

- (id)getTokenString:(id)delimiter {
    id buf = [NSMutableString stringWithString:@""];
    
    if ([self isCurrentCharDelimiter:delimiter]) {
        buf = [NSMutableString stringWithString:[self getCurrentChar]];
        current_position++;
    } else if ([[self getCurrentChar] isEqualToString:@"\""]) {
        buf = [NSMutableString stringWithString:[self getStringLiteral]];
    } else if ([[self getCurrentChar] isEqualToString:@"<"]) {
        buf = [NSMutableString stringWithString:[self getURLLiteral]];
    } else {
        while ([self hasNext] && ![self isCurrentCharDelimiter:delimiter]) {
            id c = [self getCurrentChar];
            current_position++;
            [buf appendString:c];
        }
    }
    return buf;
}

- (id)createToken:(id)str {
    if ([str rangeOfString:[NSString stringWithFormat:@"^\\s+$"]
                   options:NSRegularExpressionSearch
         ].location != NSNotFound) {
        return NULL;
        
    } else if ([str isEqualToString:@"{"]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:OPEN_BRACKET]];
        
    } else if ([str isEqualToString:@"}"]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:CLOSE_BRACKET]];
        
    } else if ([str isEqualToString:@"("]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:OPEN_PARENTHESIS]];
        
    } else if ([str isEqualToString:@")"]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:CLOSE_PARENTHESIS]];
        
    } else if ([str isEqualToString:@"."]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:PERIOD]];
        
    } else if ([str isEqualToString:@";"]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:SEMICOLON]];
        
    } else if ([[str substringToIndex:1] isEqualToString:@"<"]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:URI]];
        
    } else if ([[str substringToIndex:1] isEqualToString:@"?"]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:VARIABLE]];
        
    } else if ([str floatValue]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:NUMBER]];
        
    } else if ([str rangeOfString:[NSString stringWithFormat:@"\"@"]
                          options:NSRegularExpressionSearch
                ].location != NSNotFound) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:STRING_WITH_LANGUAGE_TAG]];
        
    } else if ([[str substringToIndex:1] isEqualToString:@"\""]) {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:STRING]];
        
    } else {
        return [[Token alloc] initWithQuery:str
                                       type:[NSNumber numberWithInt:SYMBOL]];
        
    }
}

- (id)buildToken {
    id str = [self getTokenString:nil];
    return [self createToken:str];
}

- (id)addToken {
    id token = [self buildToken];
    if (token != nil) {
        [tokens addObject:token];
    }
    return self;
}

@end
