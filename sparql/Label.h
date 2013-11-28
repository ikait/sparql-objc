//
//  Label.h
//  sparql
//
//  Created by Taishi Ikai on 2013/11/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Token.h"

@interface Label : NSObject {
    id token_label;
    id token_uri;
}

- (id)initWithToken:(Token *)t URIToken:(Token *)u;
- (BOOL)isAnonymousLabel;
- (id)toString;

@end
