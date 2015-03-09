//
//  HomeViewController.h
//  student-life
//
//  Created by Jeffrey Xiong on 2/9/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *banner;
@property (weak, nonatomic) IBOutlet UIImageView *atlasTile;
@property (weak, nonatomic) IBOutlet UIImageView *serveryTile;
@property (weak, nonatomic) IBOutlet UIImageView *calendarTile;
@property (weak, nonatomic) IBOutlet UIImageView *fondrenTile;
@property (weak, nonatomic) IBOutlet UIImageView *facilitiesTile;
@property (weak, nonatomic) IBOutlet UIImageView *directoryTile;
@property (weak, nonatomic) IBOutlet UIButton *atlasBtn;
@property (weak, nonatomic) IBOutlet UIButton *serveryBtn;
@property (weak, nonatomic) IBOutlet UIButton *calendarBtn;
@property (weak, nonatomic) IBOutlet UIButton *fondrenBtn;
@property (weak, nonatomic) IBOutlet UIButton *facilitiesBtn;
@property (weak, nonatomic) IBOutlet UIButton *directoryBtn;
@property (weak, nonatomic) IBOutlet UINavigationItem *homeBar;




@end

