//
//  wwViewController.m
//  WeightWatcher
//
//  Created by Alix Cewall on 12/23/12.
//  Copyright (c) 2012 AC. All rights reserved.
//

#import "wwViewController.h"

@interface wwViewController ()

@end

@implementation wwViewController

- (void)viewDidLoad
{
    adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    adView.frame = CGRectOffset(adView.frame, 0, -50);
    adView.requiredContentSizeIdentifiers = [NSSet setWithObject:ADBannerContentSizeIdentifier320x50];
   adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifier320x50;
    [self.view addSubview:adView];
    adView.delegate=self;
    self.bannerIsVisible=NO;
    // all above code is for iAD banner
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// method below is for iAD

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        // banner is invisible now and moved out of the screen on 50 px
        banner.frame = CGRectOffset(banner.frame, 0, 50);
        [UIView commitAnimations];
        self.bannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    if (self.bannerIsVisible)
    {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        // banner is visible and we move it out of the screen, due to connection issue
        banner.frame = CGRectOffset(banner.frame, 0, -50);
        [UIView commitAnimations];
        self.bannerIsVisible = NO;
    }
}

@end
