//
//  Variable.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"

@interface Variable : NSObject {
    id token;
    id name;
}

- (id)initWithToken:(Token *)t;
- (BOOL)isAnonymousVariable;
- (id)toString;

@end