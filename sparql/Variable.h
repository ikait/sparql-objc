//
//  Variable.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Variable : NSObject {
    id token;
    id name;
}

- (id)initWithToken:(id)t;
- (bool)isAnonymousVariable;
- (id)toString;

@end

/*
define(["token"], function(Token){
	
	var Variable = function(token){
		this.token = token;
		this.name = token.string.substr(1, token.string.length -1);
	};
	Variable.prototype = {
    isAnonymousVariable: function(){
        return this.name.length === 0;
    },
    toString: function(){
        return this.token.string;
    }
	};
	
	return Variable;
});
*/