//
//  NSString+Validator.m
//  RegFormStatic
//
//  Created by Max Soiferman on 02.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "NSString+Validator.h"

@implementation NSString (Validator)

- (BOOL) validEmail {
    if([self length]==0){
        return NO;
    }
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:self options:0 range:NSMakeRange(0, [self length])];
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}

- (BOOL)validatePhone {
//    NSString *phoneRegex = @"^((\\+)|(00))[0-9]{6,14}$";
    NSString *phoneRegex = @"^.{6,50}$";  //Password characters limit should be come between 6-20
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [phoneTest evaluateWithObject:self];
}


@end
