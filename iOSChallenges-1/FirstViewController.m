//
//  ViewController.m
//  iOS Challenge 1
//
//  Created by Chris on 8/7/14.
//  Copyright (c) 2014 clawesome Inc. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
{
    NSString *_username;
    NSString *_password;
}

- (void)viewDidAppear:(BOOL)animated
{
    _usernameErrorLabel.hidden = YES;
    _passwordErrorLabel.hidden = YES;
    
    _password = @"";
    _username = @"";
    
    [_usernameTextField setText:@""];
    [_passwordTextField setText:@""];
    
    _loginButton.enabled = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _usernameTextField.delegate = self;
    _passwordTextField.delegate = self;
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    CGRect rc = [_usernameTextField bounds];
    rc = [_usernameTextField convertRect:rc toView:_scrollView];
    rc.origin.x = 0 ;
    rc.origin.y = 0 ;
    
    rc.size.height = 400;
    [self.scrollView scrollRectToVisible:rc animated:YES];
}

#pragma mark - Text fields delagate methods

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // NSLog(@"Did begin editing");
    _loginButton.enabled = FALSE;
    _passwordErrorLabel.hidden = YES;
    _usernameErrorLabel.hidden = YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
   // NSLog(@"Did end editing");
    if([textField isEqual:_passwordTextField]){
        //NSLog(@"Password");
        _password = _passwordTextField.text;
        _passwordErrorLabel.hidden = [self checkPasswordForLengthOfEightOrMore];
    }
    else if([textField isEqual:_usernameTextField]){
        //NSLog(@"Username");
        _username = _usernameTextField.text;
        _usernameErrorLabel.hidden = [self checkUsernameForLettersAndLengthOfEightOrMore];
    }
    
    _loginButton.enabled = ([self checkUsernameForLettersAndLengthOfEightOrMore] && [self checkPasswordForLengthOfEightOrMore]);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return true;
}

#pragma mark - Validation

- (BOOL)checkUsernameForLettersAndLengthOfEightOrMore
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[a-z]{0,}"];
    if ([predicate evaluateWithObject:_username] && [_username length] >= 8)
        return TRUE;
    return FALSE;
}

- (BOOL)checkPasswordForLengthOfEightOrMore
{
    if ([_password length] >= 8)
        return TRUE;
    return FALSE;
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
