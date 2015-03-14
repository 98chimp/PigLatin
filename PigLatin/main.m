//
//  main.m
//  PigLatin
//
//  Created by Shahin on 2015-03-13.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        printf("Please enter a phrase to be translated to piglatin: ");
        char str[100];
        fgets (str, 100, stdin);
        
        NSString *input = [[NSString alloc] initWithUTF8String:str];
        input = [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSString *output = [input stringByPigLatinization];
        
        NSLog(@"%@!", output);
    }
    return 0;
}
