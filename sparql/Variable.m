//
//  Variable.m
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Variable.h"

@implementation Variable

- (id)initWithToken:(Token *)t {
    self = [super init];
    token = t;
    
    id str = [token toString];
    name = [str substringWithRange:NSMakeRange([str length] - 1, 1)];
    return self;
}

- (BOOL)isAnonymousVariable {
    return [name length] == 0;
}

- (id)toString {
    return [token toString];
}

@end
