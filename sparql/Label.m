//
//  Label.m
//  sparql
//
//  Created by Taishi Ikai on 2013/11/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import "Label.h"

@implementation Label

- (id)initWithToken:(Token *)t URIToken:(Token *)u {
    self = [super init];
    token_label = t;
    token_uri = u;
    return self;
}

- (BOOL)isAnonymousLabel {
    return [[self getLabelString] length] == 0;
}

- (id)toString {
    return [NSString stringWithFormat:
            @"(%@ %@)",
            [token_label toString],
            [token_uri toString]];
}

- (NSString *)getLabelString {
    return [token_label substringWithRange:NSMakeRange(0, [token_label length] - 1)];
}

@end
