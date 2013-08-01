//
//  VariableList.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Variable.h"

@interface VariableList : NSObject {
}

@property NSMutableArray *list;

- (id)initWithTokens:(id)tokens;
- (id)toString;

@end

/*
define(["token", "query/variable"], function(Token, Variable){
	
	function isVariable(token){
		var firstCharacter = token.string.charAt(0);
		return firstCharacter === "?" || firstCharacter === "$";
	}
	
	function hasNext(tokens){
		return tokens.length > 0 && tokens[0] && tokens[0].string === ",";
	}
	
	function createVariableList(tokens, list){
		list = list || [];
		if(tokens.length > 0){
			if(isVariable(tokens[0])){
				list.push(new Variable(tokens.shift()));
				if(hasNext(tokens)){
					tokens.shift();
					createVariableList(tokens, list);
				}
			}
		}
		return list;
	}
	
	var VariableList = function(tokens){
		this.list = createVariableList(tokens);
	};
	VariableList.prototype = {
    length: function(){
        return this.list.length;
    },
    toString: function(){
        var elms = this.list.join(",");
        
        return "(" + elms + ")";
    }
	};
	
	return VariableList;
});
*/