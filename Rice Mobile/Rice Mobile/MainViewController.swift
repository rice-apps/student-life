//
//  ViewController.swift
//  Rice Mobile
//
//  Created by Jeffrey Xiong on 9/7/15.
//  Copyright (c) 2015 Jeffrey Xiong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    // Tiles
    @IBOutlet weak var banner: UIImageView!
    @IBOutlet weak var maps: UIImageView!
    @IBOutlet weak var dining: UIImageView!
    @IBOutlet weak var calendar: UIImageView!
    @IBOutlet weak var fondren: UIImageView!
    @IBOutlet weak var facilities: UIImageView!
    @IBOutlet weak var directory: UIImageView!
    
    // Buttons
    @IBOutlet weak var mapsBtn: UIButton!
    @IBOutlet weak var diningBtn: UIButton!
    @IBOutlet weak var calendarBtn: UIButton!
    @IBOutlet weak var fondrenBtn: UIButton!
    @IBOutlet weak var facilitiesBtn: UIButton!
    @IBOutlet weak var directoryBtn: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Navigation bar
        self.navigationController?.navigationBarHidden = true
        
        // Get Screen Size
        let screenSize: CGSize = UIScreen.mainScreen().bounds.size
        let screenWidth: CGFloat = screenSize.width
        let screenHeight: CGFloat = screenSize.height

        
        // Set Tile Sizes
        let tile1 = CGRectMake(0, screenHeight * 0.45, screenWidth * 0.5, screenWidth * 0.5)
        let tile2 = CGRectMake(screenWidth / 2, screenHeight * 0.45, screenWidth * 0.5, screenWidth * 0.5)
        let tile3 = CGRectMake(0, screenHeight * 0.45 + screenWidth * 0.5, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25)
        let tile4 = CGRectMake(screenWidth / 2, screenHeight * 0.45 + screenWidth * 0.5, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25)
        let tile5 = CGRectMake(0, screenHeight * 0.725 + screenWidth * 0.25, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25)
        let tile6 = CGRectMake(screenWidth / 2, screenHeight * 0.725 + screenWidth * 0.25, screenWidth / 2, screenHeight * 0.275 - screenWidth * 0.25)
        
        // Set Tile Sizes + Images
        banner.frame = CGRectMake(0, 0, screenWidth, screenHeight * 0.45)
        maps.frame = tile1
        dining.frame = tile2
        calendar.frame = tile3
        fondren.frame = tile4
        facilities.frame = tile5
        directory.frame = tile6
        
        mapsBtn.frame = tile1
        diningBtn.frame = tile2
        calendarBtn.frame = tile3
        fondrenBtn.frame = tile4
        facilitiesBtn.frame = tile5
        directoryBtn.frame = tile6
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

