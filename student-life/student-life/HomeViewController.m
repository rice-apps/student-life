//
//  HomeViewController.m
//  student-life
//
//  Created by Jeffrey Xiong on 2/9/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Screen Size for Responsive
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenWidth = screenSize.width;
    CGFloat screenHeight = screenSize.height;
    
    // Banner Set
    self.banner.frame = CGRectMake(0, 0, screenWidth, 0.15 * screenHeight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Push actions to new pages


@end

