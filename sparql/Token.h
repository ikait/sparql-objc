//
//  Token.h
//  sparql
//
//  Created by Taishi Ikai on 2013/06/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Token : NSObject {
}

@property NSString *query;
@property NSNumber *type;

- (id)initWithQuery:(NSString *)initQuery type:(NSNumber *)initType;

- (NSString *)toString;
- (BOOL)belongsTo:(id)btype;
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