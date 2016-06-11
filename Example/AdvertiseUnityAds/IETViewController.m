//
//  IETViewController.m
//  AdvertiseUnityAds
//
//  Created by gaoyang on 06/02/2016.
//  Copyright (c) 2016 gaoyang. All rights reserved.
//

#import "IETViewController.h"
#import "UAAdvertiseHelper.h"

@interface IETViewController ()

@end

@implementation IETViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showSpot:(id)sender {
    BOOL result = [[UAAdvertiseHelper getInstance] showSpotAd:^(BOOL result) {
        NSLog(@"SpotAd Click: %@", result?@"YES":@"NO");
    }];
    NSLog(@"SpotAd Show: %@", result?@"YES":@"NO");
}

- (IBAction)isVideoReady:(id)sender {
    BOOL result = [[UAAdvertiseHelper getInstance] isVedioAdReady];
    NSLog(@"VedioAd Ready: %@", result?@"YES":@"NO");
}

- (IBAction)showVideo:(id)sender {
    BOOL result = [[UAAdvertiseHelper getInstance] showVedioAd:^(BOOL result) {
        NSString* msg = [NSString stringWithFormat:@"VedioAd Valid: %@", result?@"YES":@"NO"];
        NSLog(@"%@", msg);
    } :^(BOOL result) {
        NSString* msg = [NSString stringWithFormat:@"VedioAd Click: %@", result?@"YES":@"NO"];
        NSLog(@"%@", msg);
    }];
    NSLog(@"VedioAd Show: %@", result?@"YES":@"NO");
}

- (IBAction)showName:(id)sender {
    NSLog(@"%@", [[UAAdvertiseHelper getInstance] getName]);
}


@end
