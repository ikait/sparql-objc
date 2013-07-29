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

- (id)initWithQueryString:(NSString *)query;

@property (readonly) NSString *query_string;
@property NSMutableArray *tokens;
@property NSUInteger current_position;
@property (readonly) NSArray* DELIMITER;

+ (id)create:(id)query;
+ (id)analyze:(id)query;

- (id)startlex;
- (id)preProcess;
- (id)postProccess;
- (id)proccess;
- (BOOL)hasNext;
- (id)getCurrentChar;
- (BOOL)isDelimiter:(id)character delimiter:(id)delimiter;
- (BOOL)isCurrentCharDelimiter:(id)delimiter;
- (id)getLanguageTag;
- (id)getStringLiteral;
- (id)getURLLiteral;
- (id)getTokenString:(id)delimiter;
- (id)createToken:(id)str;
- (id)buildToken;
- (id)addToken;

@end
