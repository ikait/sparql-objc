//
//  Labellist.h
//  sparql
//
//  Created by Taishi Ikai on 2013/11/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Label.h"
#import "Token.h"
#import "Prefix.h"

@interface LabelList : NSObject
@property NSMutableArray *list;

- (id)initWithTokens:(id)tokens;
- (NSString *)toString;
@end
