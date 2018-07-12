//
//  PhoneFormatter.m
//  RegFormStatic
//
//  Created by Max Soiferman on 02.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "PhoneFormatter.h"

@implementation PhoneFormatter

-(BOOL)phoneNumberFormattingWithTextfieldText:(UITextField *)textfield andRange:(NSRange)range andReplacementString:(NSString *)string {
  
    NSInteger length = [self getLength:textfield.text];
    //NSLog(@"Length  =  %d ",length);
    
    if ([textfield.text hasPrefix:@"1"]) {
        if(length == 11)
        {
            if(range.length == 0)
                return NO;
        }
        if(length == 4)
        {
            NSString *num = [self formatNumber:textfield.text];
            textfield.text = [NSString stringWithFormat:@"%@ (%@) ",[num substringToIndex:1],[num substringFromIndex:1]];
            if(range.length > 0)
                textfield.text = [NSString stringWithFormat:@"%@",[num substringToIndex:4]];
        }
        else if(length == 7)
        {
            NSString *num = [self formatNumber:textfield.text];
            NSRange numRange = NSMakeRange(1, 3);
            textfield.text = [NSString stringWithFormat:@"%@ (%@) %@-",[num substringToIndex:1] ,[num substringWithRange:numRange],[num substringFromIndex:4]];
            if(range.length > 0)
                textfield.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
        
    } else {
        if(length == 10)
        {
            if(range.length == 0)
                return NO;
        }
        
        if(length == 3)
        {
            NSString *num = [self formatNumber:textfield.text];
            textfield.text = [NSString stringWithFormat:@"(%@) ",num];
            if(range.length > 0)
                textfield.text = [NSString stringWithFormat:@"%@",[num substringToIndex:3]];
        }
        else if(length == 6)
        {
            NSString *num = [self formatNumber:textfield.text];
            
            textfield.text = [NSString stringWithFormat:@"(%@) %@-",[num  substringToIndex:3],[num substringFromIndex:3]];
            if(range.length > 0)
                textfield.text = [NSString stringWithFormat:@"(%@) %@",[num substringToIndex:3],[num substringFromIndex:3]];
        }
    }
    return YES;
}


-(NSString*)formatNumber:(NSString*)mobileNumber {
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    NSLog(@"%@", mobileNumber);
    
    NSInteger length = [mobileNumber length];
    if (length > 10) {
        mobileNumber = [mobileNumber substringFromIndex: length-10];
        NSLog(@"%@", mobileNumber);
    }
    
    return mobileNumber;
}

-(NSInteger)getLength:(NSString*)mobileNumber {
    
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"(" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@")" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@" " withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"-" withString:@""];
    mobileNumber = [mobileNumber stringByReplacingOccurrencesOfString:@"+" withString:@""];
    
    NSInteger length = [mobileNumber length];
    
    return length;
}

@end
