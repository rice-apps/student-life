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
    
    // Tile Sizes
    CGRect tile1 = CGRectMake(0, screenHeight * 0.45, screenWidth * 0.5, screenWidth * 0.5);
    CGRect tile2 = CGRectMake(screenWidth / 2, screenHeight * 0.45, screenWidth * 0.5, screenWidth * 0.5);
    CGRect tile3 = CGRectMake(0, screenHeight * 0.45 + screenWidth * 0.5, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25);
    CGRect tile4 = CGRectMake(screenWidth / 2, screenHeight * 0.45 + screenWidth * 0.5, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25);
    CGRect tile5 =  CGRectMake(0, screenHeight * 0.725 + screenWidth * 0.25, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25);
    CGRect tile6 = CGRectMake(screenWidth / 2, screenHeight * 0.725 + screenWidth * 0.25, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25);
    
    self.banner.frame = CGRectMake(0, 0, screenWidth, screenHeight * 0.45);
    self.atlasTile.frame = tile1;
    self.serveryTile.frame = tile2;
    self.calendarTile.frame = tile3;
    self.fondrenTile.frame = tile4;
    self.facilitiesTile.frame = tile5;
    self.directoryTile.frame = tile6;
    
    self.atlasBtn.frame = tile1;
    self.serveryBtn.frame = tile2;
    self.calendarBtn.frame = tile3;
    self.fondrenBtn.frame = tile4;
    self.facilitiesBtn.frame = tile5;
    self.directoryBtn.frame = tile6;
    
    [self.navigationController setNavigationBarHidden:YES];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Push actions to new pages

@end

