//
//  Lexer.h
//  sparql
//
//  Created by Taishi Ikai on 2013/06/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"

@class Token;

@interface Lexer : NSObject {
    NSString*       query_string;
    NSMutableArray* tokens;
    NSUInteger      current_position;
    NSArray*        DELIMITER;
}

@property NSString *query_string;
@property NSMutableArray *tokens;
@property NSUInteger current_position;
@property NSArray* DELIMITER;

- (id)initWithQueryString:(NSString *)query;
+ (id)create:(id)query;
+ (id)analyze:(id)query;


// - (NSArray *)startlex;

/*
 - (id)preProcess;
 - (id)postProccess;
 - (id)process;
 - (BOOL)hasNext;
 - (char)getCurrentChar;
 - (BOOL)isDelimiter;
 - (BOOL)isCurrentCharDelimiter;
 - (NSString *)getLanguageTag;
 - (NSString *)getStringLiteral;
 - (NSString *)getTokenString;
 - (Token *)createToken;
 - (Token *)buildToken;
 - (Token *)addToken;
 */

@end
