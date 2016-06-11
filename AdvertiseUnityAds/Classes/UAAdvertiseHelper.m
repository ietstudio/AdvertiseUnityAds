//
//  UAAdvertiseHelper.m
//  Pods
//
//  Created by geekgy on 16/6/6.
//
//

#import "UAAdvertiseHelper.h"
#import "IOSSystemUtil.h"
#import <UnityAds/UnityAds.h>

@interface UAAdvertiseHelper() <UnityAdsDelegate>

@end

@implementation UAAdvertiseHelper
{
    BOOL _viewCompleted;
    void(^_viewFunc)(BOOL);
    BOOL _videoClicked;
    void(^_clickFunc)(BOOL);
}

SINGLETON_DEFINITION(UAAdvertiseHelper)

#pragma mark - AdvertiseDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%@ : %@", UnityAds_Name, [UnityAds getSDKVersion]);
    UIViewController* controller = [[IOSSystemUtil getInstance] controller];
    NSString* gameId = [[IOSSystemUtil getInstance] getConfigValueWithKey:UnityAds_GameId];
    NSString* zoneId = [[IOSSystemUtil getInstance] getConfigValueWithKey:UnityAds_ZoneId];
    [[UnityAds sharedInstance] startWithGameId:gameId andViewController:controller];
    [[UnityAds sharedInstance] setZone:zoneId];
    [[UnityAds sharedInstance] setDelegate:self];
    return YES;
}

- (int)showBannerAd:(BOOL)portrait :(BOOL)bottom {
    NSLog(@"didn't support");
    return 0;
}

- (void)hideBannerAd {
    NSLog(@"didn't support");
}

- (BOOL)showSpotAd:(void (^)(BOOL))func {
    NSLog(@"didn't support");
    return NO;
};

- (BOOL)isVedioAdReady {
    return [[UnityAds sharedInstance] canShow];
}

- (BOOL)showVedioAd:(void (^)(BOOL))viewFunc :(void (^)(BOOL))clickFunc {
    if ([self isVedioAdReady]) {
        _viewCompleted = NO;
        _videoClicked = NO;
        _viewFunc = viewFunc;
        _clickFunc = clickFunc;
        [[UnityAds sharedInstance] show];
        return YES;
    }
    return NO;
}

- (NSString *)getName {
    return UnityAds_Name;
}

#pragma mark - UnityAdsDelegate

- (void)unityAdsVideoCompleted:(NSString *)rewardItemKey skipped:(BOOL)skipped{
//    NSLog(@"unityAdsVideoCompleted %@ %@", rewardItemKey, skipped?@"YES":@"NO");
    _viewCompleted = !skipped;
}
- (void)unityAdsDidHide{
//    NSLog(@"unityAdsDidHide");
    _viewFunc(_viewCompleted);
}

@end
