//
//  GraphPattern.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GraphPattern : NSObject
@property NSMutableArray *graphs;
- (id)initWithTokens:(id)tokens;
- (id)toString;
@end
