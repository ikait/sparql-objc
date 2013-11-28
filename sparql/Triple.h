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