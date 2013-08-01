//
//  Triple.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Triple.h"

@implementation Triple

- (id)initWithSubject:(id)initSubject Predicate:(id)initPredicate Object:(id)initObject {
    self = [super init];
    subject = initSubject;
    predicate = initPredicate;
    object = initObject;
    return self;
}

- (id)toString {
    id str;
    str = [NSMutableString stringWithString:@""];
    [str appendString:@"(triple "];
    [str appendString:[subject toString]];
    [str appendString:@" "];
    [str appendString:[predicate toString]];
    [str appendString:@" "];
    [str appendString:[object toString]];
    [str appendString:@" "];
    return str;
}

@end
