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

@property NSString *query, *type;

- (id)initWithQuery:(NSString *)initQuery type:(id)initType;

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

/*
define([], function(){
	
	var Token = function(string, type){
		this.string = string;
		this.type = type;
		
		if(this.belongsTo(Token.SYMBOL)){
			this.string = this.string.toLowerCase();
		}
	};
	Token.type = {
    EOT: -1,
    SYMBOL: 0,
    OPEN_PARENTHESIS: 1,
    CLOSE_PARENTHESIS: 2,
    OPEN_BRACKET: 3,
    CLOSE_BRACKET: 4,
    SEMICOLON: 5,
    PERIOD: 6,
    STRING: 7,
    STRING_WITH_LANGUAGE_TAG: 8,
    NUMBER: 9,
    URI: 10,
    BLANK_NODE: 11,
    VARIABLE: 12,
    PREFIXED_NAME: 13
	};
	Token.prototype = {
    toString: function(){
        return this.string;
    },
    belongsTo: function(type){
        return this.type == type;
    }
	};
	Token.isToken = function(obj){
		return obj instanceof Token;
	};
	
	return Token;
});
*/