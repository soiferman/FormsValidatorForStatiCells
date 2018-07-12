//
//  Validator.m
//  RegFormStatic
//
//  Created by Max Soiferman on 02.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "Validator.h"
#import "NSString+Validator.h"
#import "Rule.h"
#import "EmailRule.h"
#import "TextRule.h"
#import "PhoneRule.h"
#import "PasswordRule.h"
#import "MatchRule.h"
#import "NotEmptyRule.h"

@interface Validator()

@property (strong, nonatomic) NSMutableArray *rules;
@property (nonatomic, strong) NSMutableArray <Rule *> *invalidRules;

@end

@implementation Validator

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.rules = [NSMutableArray new];
    }
    return self;
}

#pragma mark - Rules

- (void)addNameRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message {
    [self addTextRuleWithKey:key required:required withMessage:message minLength:1];
}

- (void)addPhoneRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message {
    
    PhoneRule *rule = [[PhoneRule alloc]init];
    rule.model = self.model;
    rule.propertyName = key;
    rule.required = required;
    rule.message = message;
    
   [self.rules addObject:rule];
}

- (void)addEmailRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message {
    EmailRule *rule = [EmailRule new];
    rule.model = self.model;
    rule.propertyName = key;
    rule.required = required;
    rule.message = message;
    
    [self.rules addObject:rule];
}

- (void)addTextRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message minLength:(int)minLength {
    
    TextRule *rule = [[TextRule alloc]init];
    rule.model = self.model;
    rule.propertyName = key;
    rule.required = required;
    rule.message = message;
    rule.minLength = minLength;
    
    [self.rules addObject:rule];
}

- (void)addPasswordRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message {
    
    [self addTextRuleWithKey:key required:required withMessage:message minLength:6];
    
}

- (void)addMatchRuleWithKey:(NSString *)key secondKey:(NSString *)secondKey required:(BOOL)required withMessage:(NSString *)message {

    MatchRule *rule = [[MatchRule alloc]init];
    rule.model = self.model;
    rule.propertyName = key;
    rule.secondPropertyName = secondKey;
    rule.required = required;
    rule.message = message;
    
    [self.rules addObject:rule];
    
}

- (void)addNotEmptyRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message {
    
    NotEmptyRule *rule = [[NotEmptyRule alloc]init];
    rule.model = self.model;
    rule.propertyName = key;
    rule.required = required;
    rule.message = message;
    
    [self.rules addObject:rule];
}

#pragma mark - Validate

- (BOOL)validate {
    
    self.invalidRules = [NSMutableArray new];
    for (Rule *rule in self.rules) {
        
        if (![self validateRule:rule]) {
            [self.invalidRules addObject:rule];
        }
    }
    return self.invalidRules.count ? NO : YES;
}

- (BOOL)validateRule:(Rule *)rule {
    if (rule.required || !rule.isEmpty) {
        return [rule validate];
    }
    
    return YES;
}

- (NSString *)invalidMessage {
    return [self.invalidRules firstObject].message;
    
}

@end
