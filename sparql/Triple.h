//
//  Triple.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Triple : NSObject {
    id subject;
    id predicate;
    id object;
}

- (id)initWithSubject:(id)s Predicate:(id)p Object:(id)o;
- (id)toString;

@end

/*
define([], function(){
	
	var Triple = function(subject, predicate, object){
		this.subject = subject;
		this.predicate = predicate;
		this.object = object;
	};
	
	Triple.prototype = {
    toString: function(){
        return "(triple " + this.subject.toString() + " " +
        this.predicate.toString() + " " +
        this.object.toString() + ")";
    }
	};
	
	return Triple;
	
});
*/