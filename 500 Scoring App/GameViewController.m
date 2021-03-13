//
//  GameViewController.m
//  AvoidTheSquares - iOS
//
//  Created by Lee Warren on 3/12/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import "GameViewController.h"
#import "GameScene.h"
#import <iAd/iAd.h>


@interface GameViewController () <ADBannerViewDelegate>



@end

@implementation GameViewController

// iad stuff
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (banner.isBannerLoaded) {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // Assumes the banner view is placed at the bottom of the screen.
        banner.frame = CGRectOffset(banner.frame, 0, banner.frame.size.height);
        [UIView commitAnimations];
    }
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!banner.isBannerLoaded) {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // Assumes the banner view is just off the bottom of the screen.
        banner.frame = CGRectOffset(banner.frame, 0, -banner.frame.size.height);
        [UIView commitAnimations];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"hideAd" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotification:) name:@"showAd" object:nil];

    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    /* Sprite Kit applies additional optimizations to improve rendering performance */
    skView.ignoresSiblingOrder = YES;
    

    // Create and configure the scene.
    //GameScene *scene = [GameScene unarchiveFromFile:@"GameScene"];
    GameScene *scene = [GameScene sceneWithSize:[skView bounds].size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    // Present the scene.
    [skView presentScene:scene];
        
}

// iad stuff
 - (void)handleNotification:(NSNotification *)notification
{
    if ([notification.name isEqualToString:@"hideAd"]) {
        self.canDisplayBannerAds = NO;

    } else if ([notification.name isEqualToString:@"showAd"]) {
        //if ( [[InAppManager sharedManager]isFeature1PurchasedAlready] == YES) {
         //self.canDisplayBannerAds = NO;
         //} else {
         
        self.canDisplayBannerAds = YES;

    }
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillLayoutSubviews
{
    // iad stuff
     self.banner = [[ADBannerView alloc] initWithFrame:CGRectZero];
    self.banner.delegate = self;
    [self.banner sizeToFit];
    
   /* if ( [[InAppManager sharedManager]isFeature1PurchasedAlready] == YES) {
        self.canDisplayBannerAds = NO;
    } else {
        self.canDisplayBannerAds = YES;
    }
    */
    
    [super viewWillLayoutSubviews];
    
}


- (BOOL)prefersStatusBarHidden {
    return YES;
}



@end




