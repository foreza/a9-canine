//
//  FirstViewController.m
//  Canine
//
//  Created by Jason C on 7/9/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <AmazonAdViewDelegate>

@property (nonatomic) AmazonAdView *amazonAdView;

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Load an ad
    [self loadAd];
}


// Load a basic ad.
- (void) loadAd {
    
    // If the AdView exists, kill it
    if (self.amazonAdView) {
        [self.amazonAdView removeFromSuperview];
        self.amazonAdView = nil;
    }
    // Initialize Auto Ad Size View
    const CGRect adFrame = CGRectMake(0.0f, 20.0f, [UIScreen mainScreen].bounds.size.width, 90.0f);
    self.amazonAdView = [[AmazonAdView alloc] initWithFrame:adFrame];
    [self.amazonAdView setHorizontalAlignment:AmazonAdHorizontalAlignmentCenter];
    [self.amazonAdView setVerticalAlignment:AmazonAdVerticalAlignmentFitToContent];
    
    // Register the ViewController with the delegate to receive callbacks.
    self.amazonAdView.delegate = self;
    
    //Set the ad options and load the ad
    AmazonAdOptions *options = [AmazonAdOptions options];
    options.isTestRequest = YES;
    options.timeout = 20; // 20 seconds
    [self.amazonAdView loadAd:options];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark AmazonAdViewDelegate
// @required
- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}

// @optional
- (void)adViewWillExpand:(AmazonAdView *)view {
    NSLog(@"Will present modal view for an ad. Its time to pause other activities.");
}

// @optional
- (void)adViewDidCollapse:(AmazonAdView *)view {
    NSLog(@"Modal view has been dismissed, its time to resume the paused activities.");
}

- (void)adViewDidLoad:(AmazonAdView *)view
{
    // Add the newly created Amazon Ad view to our view.
    [self.view addSubview:view];
    NSLog(@"Ad loaded");
}

// @optional
- (void)adViewDidFailToLoad:(AmazonAdView *)view withError:(AmazonAdError *)error {
    NSLog(@"Ad Failed to load. Error code %d: %@", error.errorCode, error.errorDescription);
}

@end
