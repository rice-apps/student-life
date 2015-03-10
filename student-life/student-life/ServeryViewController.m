//
//  ServeryViewController.m
//  student-life
//
//  Created by Jeffrey Xiong on 3/8/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import "ServeryViewController.h"

@interface ServeryViewController ()

@end

@implementation ServeryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    NSString *serveryString = @"http://servery.riceapps.org";
    NSURL *serveryURL = [NSURL URLWithString:serveryString];
    
    NSURLRequest *serveryRequest = [NSURLRequest requestWithURL:serveryURL];
    
    [self.serveryView loadRequest:serveryRequest];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
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
