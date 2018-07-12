//
//  TextRule.m
//  RegFormStatic
//
//  Created by Max Soiferman on 03.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "TextRule.h"

@implementation TextRule

@synthesize message = _message;

- (BOOL)validate {
    
    if (self.value == nil) {
        return NO;
    }
    
    NSString *str = [NSString stringWithFormat:@"%@", self.value];
    if (str.length < self.minLength) {
        return  NO;
    }
    return YES;
}

- (NSString *)message {
    NSString * str = [NSString stringWithFormat:_message, self.minLength];
    return str;
}


@end
