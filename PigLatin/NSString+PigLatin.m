//
//  NSString+PigLatin.m
//  PigLatin
//
//  Created by Shahin on 2015-03-13.
//  Copyright (c) 2015 98% Chimp. All rights reserved.
//

#import "NSString+PigLatin.h"

@implementation NSString (PigLatin)

-(NSString *)stringByPigLatinization {
    //A. take input from user
    //      - done in main.m
    //B. process input
    //  1. turn input into parsed words
    //      a. recognize characters
    //          i) iterate over input
    //          ii) look for white space
    NSArray *inputWords = [self componentsSeparatedByString:@" "];
    
    //      b. package them into individual words
    //          i) store each word into a temp variable
    NSMutableArray *outputWords = [NSMutableArray new];
    
    //  2. pigLatinize each word
    //      a. move initial consontant(s) to end of word
    //          i) interate over word
    //          ii) recognize constonant(s)
    //          iii) remove consontant(s) from word
    //          iv) store consonant(s) into a temp variable
    //          v) add consonant(s) to the end of modified word
    //      b. add 'ay' to the end of the word
    NSCharacterSet *vowelSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiouy"];
 
    for (NSString *word in inputWords) {
        
        NSRange range = [word rangeOfCharacterFromSet:vowelSet];
        
        if (range.location == 0) {
            NSString *outputWord = [NSString stringWithFormat:@"%@way", word];
            [outputWords addObject:outputWord];
        }
        else {
            NSUInteger startLength = range.location ;
            NSRange startRange = NSMakeRange(0, startLength);
            NSString *start = [word substringWithRange:startRange];
            
            NSUInteger endLength = word.length - range.location;
            NSRange endRange = NSMakeRange(range.location, endLength);
            NSString *end = [word substringWithRange:endRange];
            
            NSString *outputWord = [NSString stringWithFormat:@"%@%@ay", end, start];
            [outputWords addObject:outputWord];
        }
    }
    //C. print the pigLatinized input
    //
    return [outputWords componentsJoinedByString:@" "];;
}

@end
