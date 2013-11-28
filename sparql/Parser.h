//
//  Parser.h
//  sparql
//
//  Created by Taishi Ikai on 2013/07/28.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Prefix.h"

@interface Parser : NSObject
@property NSMutableArray *tokens, *tree;

- (id)initWithTokens:(id)tokens;
- (id)parseTokens;

@end
