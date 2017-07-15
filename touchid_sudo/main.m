//
//  main.m
//  touchid_sudo
//
//  Created by Clément Padovani on 7/15/17.
//  Copyright © 2017 Clément Padovani. All rights reserved.
//

@import Foundation;

#import "TCSULauncher.h"
#import "TCSUPrinter.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        if (![TCSULauncher knowsWhatToLaunch])
        {
            [TCSUPrinter printAndLogErrorMessageWithString: @"Please pass arguments"];
            
            return -1;
        }
        
        return 0;
    }
}
