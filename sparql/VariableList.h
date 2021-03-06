//
//  VariableList.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Variable.h"

@interface VariableList : NSObject
@property NSMutableArray *list;
- (id)initWithTokens:(id)tokens;
- (NSString *)toString;
@end