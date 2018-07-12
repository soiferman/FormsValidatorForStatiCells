//
//  MatchRule.m
//  RegFormStatic
//
//  Created by Max Soiferman on 03.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "MatchRule.h"

@implementation MatchRule

- (BOOL)validate {
    
    NSString *str = [NSString stringWithFormat:@"%@", self.value];
    NSString *str2 = [NSString stringWithFormat:@"%@", self.secondValue];
    
    if ([str isEqualToString:str2]) {
        return YES;
    }
    
    return NO;
}

- (id)secondValue {
    return [self.model valueForKeyPath:self.secondPropertyName];
}




@end
