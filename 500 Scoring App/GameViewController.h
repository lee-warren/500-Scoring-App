//
//  GameViewController.h
//  AvoidTheSquares - iOS
//

//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <iAd/iAd.h>


@interface GameViewController : UIViewController {
    
    NSUserDefaults *defaults;

    int gemAmount;
}


@property (strong, nonatomic) IBOutlet ADBannerView *banner;

@end
