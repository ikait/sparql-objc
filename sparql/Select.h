//
//  Select.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"
#import "VariableList.h"
#import "GraphPattern.h"

@class Token;

@interface Select : NSObject {
    id variables;
    id graphpatterns;
}
+ (BOOL)isSelectToken:(id)token;

- (id)initWithTokens:(id)tokens;
- (NSString *)toString;

@end