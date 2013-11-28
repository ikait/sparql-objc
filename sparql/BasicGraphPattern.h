//
//  BasicGraphPattern.h
//  sparql
//
//  Created by Taishi Ikai on 2013/08/01.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BasicGraphPattern : NSObject {
    id triples;
}

- (id)initWithTokens:(id)tokens;
- (id)toString;

- (BOOL)isTokenValue:(id)tokens Value:(id)value Index:(NSUInteger)index;
- (BOOL)terminated:(id)tokens;
- (id)extractTriples:(id)tokens;
@end