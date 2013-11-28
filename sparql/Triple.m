//
//  Triple.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Triple.h"

@implementation Triple

- (id)initWithSubject:(id)s Predicate:(id)p Object:(id)o {
    self = [super init];
    subject = s;
    predicate = p;
    object = o;
    return self;
}

- (id)toString {
    return [NSMutableString stringWithFormat:
            @"%@%@%@%@%@%@%@",
            @"(triple ",
            [subject toString],
            @" ",
            [predicate toString],
            @" ",
            [object toString],
            @")"];
}

@end
