//
//  SecondViewController.m
//  Canine
//
//  Created by Jason C on 7/9/18.
//  Copyright © 2018 Jason C. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController () <AmazonAdInterstitialDelegate>

@property (strong, nonatomic) AmazonAdInterstitial *interstitial;

@end

@implementation SecondViewController


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.interstitial = [AmazonAdInterstitial amazonAdInterstitial];
    self.interstitial.delegate = self;
    
    AmazonAdOptions *options = [AmazonAdOptions options];
    options.isTestRequest = YES;
    [self.interstitial load:options];
}

- (BOOL)shouldAutorotate
{
    return YES;
}



- (IBAction)showAmazonInterstitial:(UIButton *)sender
{
    [self.interstitial presentFromViewController:self];
}

#pragma mark - AmazonAdInterstitialDelegate

- (void)interstitialDidLoad:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstial loaded.");
    [self.interstitial presentFromViewController:self];

}

- (void)interstitialDidFailToLoad:(AmazonAdInterstitial *)interstitial withError:(AmazonAdError *)error
{
    NSLog(@"Interstitial failed to load.");
}

- (void)interstitialWillPresent:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstitial will be presented.");
}

- (void)interstitialDidPresent:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstitial has been presented.");
}

- (void)interstitialWillDismiss:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstitial will be dismissed.");
}

- (void)interstitialDidDismiss:(AmazonAdInterstitial *)interstitial
{
    NSLog(@"Interstitial has been dismissed.");
}


@end
