//
//  Validator.h
//  RegFormStatic
//
//  Created by Max Soiferman on 02.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegistrationModel.h"

@interface Validator : NSObject

@property (nonatomic, strong) id model;

- (void)addNameRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message;
- (void)addEmailRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message;
- (void)addPhoneRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message;
- (void)addTextRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *) message minLength:(int)minLength;
- (void)addPasswordRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message;
- (void)addMatchRuleWithKey:(NSString *)key secondKey:(NSString *)secondKey required:(BOOL)required withMessage:(NSString *)message;
- (void)addNotEmptyRuleWithKey:(NSString *)key required:(BOOL)required withMessage:(NSString *)message;

- (BOOL)validate;
- (NSString *)invalidMessage;


@end
