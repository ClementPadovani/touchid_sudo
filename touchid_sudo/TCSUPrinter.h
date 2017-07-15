//
//  TCSUPrinter.h
//  touchid_sudo
//
//  Created by Clément Padovani on 7/15/17.
//  Copyright (c) 2017 Clément Padovani. All rights reserved.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface TCSUPrinter : NSObject

+ (void) printAndLogError: (NSError *) error;

+ (void) printAndLogErrorMessageWithString: (NSString *) errorString;

@end

NS_ASSUME_NONNULL_END
