//
//  Token.h
//  sparql
//
//  Created by Taishi Ikai on 2013/06/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Token : NSObject {
    NSString *str;
    NSString *type;
}

@property NSString *str, *type;

- (id)initWithString:(NSString *)query type:(id)type;

- (NSString *)toString;
- (BOOL)belongsTo:(id)type;
+ (BOOL)isToken:(id)obj;

@end

enum {
    EOT = -1,
    SYMBOL = 0,
    OPEN_PARENTHESIS,
    CLOSE_PARENTHESIS,
    OPEN_BRACKET,
    CLOSE_BRACKET,
    SEMICOLON,
    PERIOD,
    STRING,
    STRING_WITH_LANGUAGE_TAG,
    NUMBER,
    URI,
    BLANK_NODE,
    VARIABLE,
    PREFIXED_NAME
};