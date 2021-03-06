//
//  AtlasViewController.m
//  student-life
//
//  Created by Jeffrey Xiong on 3/7/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import "AtlasViewController.h"

@interface AtlasViewController ()

@end

@implementation AtlasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    NSString *atlasString = @"http://atlas.riceapps.org";
    NSURL *atlasURL = [NSURL URLWithString:atlasString];
    
    NSURLRequest *atlasRequest = [NSURLRequest requestWithURL:atlasURL];
    
    [self.atlasView loadRequest:atlasRequest];
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
