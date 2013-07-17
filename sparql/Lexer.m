//
//  Lexer.m
//  sparql
//
//  Created by Taishi Ikai on 2013/06/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Lexer.h"

@implementation Lexer

@synthesize query_string, tokens, current_position, DELIMITER;

- (id)initWithQueryString:(NSString *)query {
    self = [super init];
    if (self != nil) {
        self.query_string = query;
        self.DELIMITER = @[@" ",
                           @"\n",
                           @"{",
                           @"}",
                           @".",
                           @";",
                           @","];
    }
    return self;
}

+ (id)create:(id)query {
    return [[Lexer alloc] initWithQueryString:query];
}

+ (id)analyze:(id)query {
    id lexer = [Lexer create:query];
    return [lexer startlex];
}

- (id)startlex {
    if (self.tokens && [self.tokens count] > 0) {
        return self.tokens;
    }
    [self preProcess];
    [self proccess];
    [self postProccess];
    
    return self.tokens;
}

- (id)preProcess {
    self.current_position = 0;
    self.tokens = [[NSMutableArray alloc] init];
    return self;
}

- (id)postProccess {
    self.current_position = NSNotFound;
    return self;
}

- (id)proccess {
    if (self.current_position == NSNotFound) {
        [self preProcess];
    }
    while ([self hasNext]) {
        [self addToken];
    }
    return self;
}

- (BOOL)hasNext {
    return self.current_position < [self.query_string length];
}

- (id)getCurrentChar {
    //    return [self.query_string characterAtIndex:self.current_position];
    return [self.query_string substringWithRange:NSMakeRange(current_position, 1)];
}

- (BOOL)isDelimiter:(id)character delimiter:(id)delimiter {
    if ([delimiter isMemberOfClass: [NSString class]]) {
        return character == delimiter;
        //    } else if (delimiter != nil && ) {
        //        return [delimiter rangeOfString:char] >= 0;
        //    }
    }
    return [self.DELIMITER indexOfObject:character] != NSNotFound;
}

- (BOOL) isCurrentCharDelimiter:(id)delimiter {
    return [self isDelimiter:[self getCurrentChar] delimiter:delimiter];
}

- (id) getLanguageTag {
    if (![[self getCurrentChar] isEqualToString:@"@"]) return @"";
    NSMutableString *buf = [self getCurrentChar];
    self.current_position++;
    [buf appendString:[self getTokenString:@""]];
    return buf;
}

- (id)getStringLiteral {
    if (![[self getCurrentChar] isEqualToString:@"\""]) return @"";
    
    NSMutableString *buf = [self getCurrentChar];
    self.current_position++;
    
    [buf appendString:[self getTokenString:@"\""]];
    
    [buf appendString:[self getCurrentChar]];
    self.current_position++;
    
    [buf appendString:[self getLanguageTag]];
    
    return buf;
}

- (id)getURLLiteral {
    if (![[self getCurrentChar] isEqualToString:@"<"]) return @"";
    
    NSMutableString *buf = [self getCurrentChar];
    self.current_position++;
    
    [buf appendString:[self getTokenString:@">"]];
    
    [buf appendString:[self getCurrentChar]];
    self.current_position++;
    
    return buf;
}

- (id)getTokenString:(id)delimiter {
    id buf = [NSMutableString stringWithString:@""];
    
    if ([self isCurrentCharDelimiter:delimiter]) {
        buf = [NSMutableString stringWithString:[self getCurrentChar]];
        self.current_position++;
    } else if ([[self getCurrentChar] isEqualToString:@"\""]) {
        buf = [NSMutableString stringWithString:[self getStringLiteral]];
    } else if ([[self getCurrentChar] isEqualToString:@"<"]) {
        buf = [NSMutableString stringWithString:[self getURLLiteral]];
    } else {
        while ([self hasNext] && ![self isCurrentCharDelimiter:delimiter]) {
            id c = [self getCurrentChar];
            self.current_position++;
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
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:OPEN_BRACKET]];
    } else if ([str isEqualToString:@"}"]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:CLOSE_BRACKET]];
    } else if ([str isEqualToString:@"("]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:OPEN_PARENTHESIS]];
    } else if ([str isEqualToString:@")"]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:CLOSE_PARENTHESIS]];
    } else if ([str isEqualToString:@"."]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:PERIOD]];
    } else if ([str isEqualToString:@";"]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:SEMICOLON]];
    } else if ([[str substringToIndex:1] isEqualToString:@"<"]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:URI]];
    } else if ([[str substringToIndex:1] isEqualToString:@"?"]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:VARIABLE]];
    } else if ([str floatValue]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:NUMBER]];
    } else if ([str rangeOfString:[NSString stringWithFormat:@"\"@"]
                          options:NSRegularExpressionSearch
                ].location != NSNotFound) {
        return [[Token alloc] initWithString:str
                                        type:[NSNumber numberWithInt:STRING_WITH_LANGUAGE_TAG]];
    } else if ([[str substringToIndex:1] isEqualToString:@"\""]) {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:STRING]];
    } else {
        return [[Token alloc] initWithString:str type:[NSNumber numberWithInt:SYMBOL]];
    }
}

- (id)buildToken {
    id str = [self getTokenString:@""];
    return [self createToken:str];
}

- (id)addToken {
    id token = [self buildToken];
    if (token != nil) {
        [self.tokens addObject:token];
    }
    return self;
}

@end
