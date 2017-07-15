//
//  TCSULauncher.m
//  touchid_sudo
//
//  Created by Clément Padovani on 7/15/17.
//  Copyright (c) 2017 Clément Padovani. All rights reserved.
//

#import "TCSULauncher.h"
@import LocalAuthentication;
@import Security;

@interface TCSULauncher ()

@end

@implementation TCSULauncher

+ (BOOL) knowsWhatToLaunch
{
    NSArray <NSString *> *launchArguments = [[NSProcessInfo processInfo] arguments];
    
    return ([launchArguments count] > 1); // we don't care about our path
}

+ (void) performLaunch
{
    
}

@end
