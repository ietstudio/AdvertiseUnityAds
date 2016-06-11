//
//  UAAdvertiseHelper.h
//  Pods
//
//  Created by geekgy on 16/6/6.
//
//

#import <Foundation/Foundation.h>
#import "AdvertiseDelegate.h"
#import "Macros.h"

#define UnityAds_Name               @"UnityAds"
#define UnityAds_GameId             @"UnityAds_GameId"
#define UnityAds_ZoneId             @"UnityAds_ZoneId"

@interface UAAdvertiseHelper : NSObject <AdvertiseDelegate>

SINGLETON_DECLARE(UAAdvertiseHelper)

@end
