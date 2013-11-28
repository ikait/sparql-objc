//
//  ParseTree.h
//  sparql
//
//  Created by Taishi Ikai on 2013/11/27.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"

@interface ParseTree : NSObject {
    id declaration;
    id query;
}

@end
