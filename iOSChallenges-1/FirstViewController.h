//
//  ViewController.h
//  iOS Challenge 1
//
//  Created by Chris on 8/7/14.
//  Copyright (c) 2014 clawesome Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UILabel *usernameErrorLabel;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *passwordErrorLabel;


@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
