//
//  PhoneRule.m
//  RegFormStatic
//
//  Created by Max Soiferman on 03.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "PhoneRule.h"

@implementation PhoneRule

- (BOOL)validate {
    return [[self value] validatePhone];
}

@end
