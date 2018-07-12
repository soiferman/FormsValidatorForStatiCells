//
//  PhoneFormatter.h
//  RegFormStatic
//
//  Created by Max Soiferman on 02.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PhoneFormatter : NSObject

-(BOOL)phoneNumberFormattingWithTextfieldText:(UITextField *)textfield andRange:(NSRange)range andReplacementString:(NSString *)string;

@end
