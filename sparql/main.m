//
//  main.m
//  sparql
//
//  Created by Taishi Ikai on 2013/06/26.
//  Copyright (c) 2013年 ikai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lexer.h"
#import "Parser.h"

void printToken(id tokens)
{
    long j = [tokens count];

    printf("%s", "\n");
    for (int i = 0; i < j; i += 1) {
//        printf("\x1b[7m%3d \x1b[m ", i + 1);
        printf("%3d| ", i + 1);
        printf("%s\n", [[[tokens objectAtIndex:i] toString] UTF8String]);
    }
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {

        char buf[5096];
        NSMutableString *str = [[NSMutableString alloc] init];
        id tokens;
        id parser;
        
        printf("%s", "\nSPARQL:\n");
        
//        // 複数行入力
//        while (fgets(buf, sizeof buf, stdin) != NULL) {
//            [str appendString:[NSString stringWithCString:buf encoding:NSUTF8StringEncoding]];
//        }
        
        // 1行入力(デバッグ用)
        fgets(buf, sizeof(buf), stdin);
        [str appendString:[NSString stringWithCString:buf encoding:NSUTF8StringEncoding]];
        
        //
        printf("%s", "\n\nToken:\n");
        tokens = [Lexer analyze:str];
        printToken(tokens);
        
        //
        parser = [[Parser alloc] initWithTokens:tokens];
        id parse_tree = [parser parseTokens];
        NSLog(@"%@", parse_tree);
    }
    return 0;
}

