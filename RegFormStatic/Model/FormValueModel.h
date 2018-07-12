//
//  FormValueModel.h
//  RegFormStatic
//
//  Created by Max Soiferman on 02.07.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValueModel : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) BOOL isRequired;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *title;


@end
