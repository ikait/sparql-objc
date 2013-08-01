//
//  BasicGraphPattern.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicGraphPattern : NSObject {
    id triples;
}

- (id)initWithTokens:(id)tokens;
- (id)toString;

- (bool)isTokenValue:(id)tokens Value:(id)value Index:(id)index;
- (bool)terminated:(id)tokens;
- (id)extractTriples:(id)tokens;
@end

/*
define(["query/triple"], function(Triple){
	
	function isTokenValue(tokens, value, index){
		index = index || 0;
		return tokens.length > 0 && tokens[0] && tokens[0].string === value;
	}
	
	function terminated(tokens){
		return isTokenValue(tokens, "}");
	}
	
	function extractTriples(tokens){
		var list = [];
		var subject = null;
		
		if(isTokenValue("{")){
			tokens.shift(); // XXX
		}
		while(!terminated(tokens)){
			subject = subject || tokens.shift();
			var predicate = tokens.shift();
			var object = tokens.shift();
			list.push(new Triple(subject, predicate, object));
			if(isTokenValue(tokens, ";")){
				subject = null;
			}
			tokens.shift();
		}
		tokens.shift();
		return list;
	}
	
	var BasicGraphPattern = function(tokens){
		this.triples = extractTriples(tokens);
	};
	
	BasicGraphPattern.prototype = {
    toString: function(){
        return "(bgp " + this.triples.join(",") + ")";
    }
	};
	
	return BasicGraphPattern;
});
*/