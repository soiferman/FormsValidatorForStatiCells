//
//  TableViewController.m
//  RegFormStatic
//
//  Created by Max Soiferman on 30.06.2018.
//  Copyright © 2018 Max Soiferman. All rights reserved.
//

#import "TableViewController.h"

static const int maximumPasswordLength = 30;

@interface TableViewController () <UITextFieldDelegate>

@property (nonatomic, strong) RegistrationModel *regModel;
@property (nonatomic, strong) Validator *validator;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.regModel = [[RegistrationModel alloc]init];
    
    [self configurateValidator];
    
}

- (void)configurateValidator {
    self.validator = [[Validator alloc] init];
    self.validator.model = self.regModel;
    [self.validator addNameRuleWithKey:@"firstName" required:YES withMessage:@"Введите имя"];
    [self.validator addNameRuleWithKey:@"lastName" required:YES withMessage:@"Введите фамилию"];
    [self.validator addPhoneRuleWithKey:@"phoneNumber" required:YES withMessage:@"Введите номер телефона"];
    [self.validator addEmailRuleWithKey:@"email" required:YES withMessage:@"Ведите корректный email"];
    [self.validator addPasswordRuleWithKey:@"password" required:YES withMessage:@"Пароль должен содержать минимум %d символов"];
    [self.validator addMatchRuleWithKey:@"confirmPassword" secondKey:@"password" required:YES withMessage:@"Введенные пароли не совпадают"];
  //  [self.validator addNotEmptyRuleWithKey:@"YOUR KEY" required:NO withMessage:@"Поле не может быть пустым"]; //Enter your key for validation
   
}

- (void)fillRegistrationModel {
    
    self.regModel.firstName = self.firstName.text;
    self.regModel.lastName = self.lastName.text;
    self.regModel.phoneNumber = self.phoneNumber.text;
    self.regModel.email = self.email.text;
    self.regModel.password = self.password.text;
    self.regModel.confirmPassword = self.confirmPassword.text;
}

#pragma mark - Table view data source


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

#pragma mark - Alerts

- (void)alertWithMessage:(NSString *)alertMessage {

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Ошибка" message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];

    if (self.presentedViewController == nil) {
        [self presentViewController:alertController animated:YES completion:nil];
         }
}

#pragma mark - Actions

- (IBAction)saveButton:(id)sender {
    
    [self.view endEditing:YES];
    
    if (![self.validator validate]) {
        [self alertWithMessage:[self.validator invalidMessage]];
       // return;
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self fillRegistrationModel];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([textField isEqual:self.phoneNumber]) {
        PhoneFormatter *formatter = [[PhoneFormatter alloc]init];
        return [formatter phoneNumberFormattingWithTextfieldText:self.phoneNumber andRange:range andReplacementString:string];
    }
    
    if (textField == self.password) {
        if (self.password.text.length >= maximumPasswordLength && range.length == 0) {
            return NO;
        }
    }
    
    if (textField == self.confirmPassword) {
        if (self.confirmPassword.text.length >= maximumPasswordLength && range.length == 0) {
            return NO;
        }
    }
    
    return YES;
}


@end
