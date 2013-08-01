//
//  Select.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"

@class Token;

@interface Select : NSObject {
    id variables;
    id graphpatterns;
}
+ (bool)isSelectToken:(id)token;

- (id)initWithToken:(id)tokens;
- (NSString *)toString;

@end

/*
define(["token", "query/variable_list", "query/graph_pattern"], function(Token, VariableList, GraphPattern){
    
	function testTokenString(token){
		var str = token.string;
		return str === "select";
	};
    
	function extractVariables(tokens){
		return new VariableList(tokens);
	}
    
	function extractGraphPatterns(tokens){
		return new GraphPattern(tokens);
	}
    
	function hasWhereClause(tokens){
		console.log(tokens);
		return tokens.length > 0 && tokens != null && tokens[0].string === "where";
	}
    
	var Select = function(tokens){
		this.variables = extractVariables(tokens);
		if(hasWhereClause(tokens)){s
			tokens.shift();
			this.graphpatterns = extractGraphPatterns(tokens);
		}
	};
	Select.prototype = {
    toString: function(){
        return "(select " + this.variables.toString() + this.graphpatterns.toString() + ")";
    }
	};
    
	Select.isSelectToken = function(token){
		return Token.isToken(token) &&
        token.belongsTo(Token.type.SYMBOL) &&
        testTokenString(token);
	};
    
	return Select;
});
*/