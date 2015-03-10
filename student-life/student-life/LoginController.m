//
//  LoginController.m
//  student-life
//
//  Created by James Hoke Peacock IV on 3/9/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()

@end

@implementation LoginController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    NSString *loginString = @"https://netid.rice.edu/cas/login";
    NSURL *loginURL = [NSURL URLWithString:loginString];
    
    NSURLRequest *loginRequest = [NSURLRequest requestWithURL:loginURL];
    
    [self.loginView loadRequest:loginRequest];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
