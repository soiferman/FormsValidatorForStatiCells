//
//  TableViewController.h
//  RegFormStatic
//
//  Created by Max Soiferman on 30.06.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Validator.h"
#import "PhoneFormatter.h"
#import "Validator.h"
#import "RegistrationModel.h"
#import "Rule.h"

@interface TableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;
@property (weak, nonatomic) IBOutlet UITextField *email;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;

- (IBAction)saveButton:(id)sender;


@end
