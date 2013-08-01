//
//  GraphPattern.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphPattern : NSObject

@end

/*
define(["query/basic_graph_pattern"], function(BasicGraphPattern){
	
	function hasNext(){
		return false; // XXXX
	}
	
	function extractGraphs(tokens, list){
		list = list || [];
		list.push(new BasicGraphPattern(tokens));
		if(hasNext(tokens)){
			tokens.shift();
			extractGraphs(tokens, list);
		}
		return list;
	}
	
	var GraphPattern = function(tokens){
		this.graphs = extractGraphs(tokens);
	}
	
	GraphPattern.prototype = {
    toString: function(){
        return "(" + this.graphs.join(" ") + ")";
    }
	};
	
	return GraphPattern;
	
});
*/