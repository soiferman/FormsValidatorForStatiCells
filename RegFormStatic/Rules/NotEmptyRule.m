//
//  NotEmptyRule.m
//  RegFormStatic
//
//  Created by Max Soiferman on 04.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "NotEmptyRule.h"

@implementation NotEmptyRule

- (BOOL)validate {
    
    NSString *str = [NSString stringWithFormat:@"%@", self.value];
    if ([str isEqualToString:@""]) {
        return NO;
    }
    return YES;
    
}

@end
