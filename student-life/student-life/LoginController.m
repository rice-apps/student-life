//
//  LoginController.m
//  student-life
//
//  Created by James Hoke Peacock IV on 3/9/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import "LoginController.h"
@import Foundation;

@interface LoginController ()

@end

@implementation LoginController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginView.delegate = self;
    
    [self.navigationController setNavigationBarHidden:NO];
    
    NSString *loginString = @"https://netid.rice.edu/cas/login";
    NSURL *loginURL = [NSURL URLWithString:loginString];
    
    NSURLRequest *loginRequest = [NSURLRequest requestWithURL:loginURL];
    
    [self.loginView loadRequest:loginRequest];
    NSLog(@"Helloo");
    
    // Do any additional setup after loading the view.
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Hello");
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *cookieJar = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [cookieJar cookies]) {
        NSLog(@"%@", cookie);
        if ([cookie.name isEqualToString:@"CASTGC"]) {
            [self.navigationController popViewControllerAnimated:YES];
                
        }
        
    }
    
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
