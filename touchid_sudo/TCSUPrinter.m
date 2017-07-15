//
//  TCSUPrinter.m
//  touchid_sudo
//
//  Created by Clément Padovani on 7/15/17.
//  Copyright (c) 2017 Clément Padovani. All rights reserved.
//

#import "TCSUPrinter.h"
@import os.log;

@interface TCSUPrinter ()

@property (strong, class, readonly) NSFileHandle *standardOutputFileHandle;

@property (strong, class, readonly) os_log_t loggingComponent;

@end

@implementation TCSUPrinter

+ (NSFileHandle *) standardOutputFileHandle
{
    static NSFileHandle *_standardOutputFileHandle = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _standardOutputFileHandle = [NSFileHandle fileHandleWithStandardOutput];
    });
    
    return _standardOutputFileHandle;
}

+ (os_log_t) loggingComponent
{
    static os_log_t _loggingComponent = NULL;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _loggingComponent = os_log_create("com.clementpadovani.touchid_sudo", "log");
    });
    
    return _loggingComponent;
}

+ (void) logToStandardOutputWithString: (NSString *) stringToLog
{
    NSData *encodedStringToLog = [[stringToLog stringByAppendingString: @"\n"] dataUsingEncoding: NSUTF8StringEncoding];
    
    [[self standardOutputFileHandle] writeData: encodedStringToLog];
}

+ (void) logErorStringToConsoleWitString: (NSString *) errorString
{
    os_log_error([self loggingComponent], "%@", errorString);
}

+ (void) printAndLogError: (NSError *) error
{
    NSString *errorMessage = [error localizedDescription];
    
    [self printAndLogErrorMessageWithString: errorMessage];
}

+ (void) printAndLogErrorMessageWithString: (NSString *) errorString
{
    [self logToStandardOutputWithString: errorString];
    
    [self logErorStringToConsoleWitString: errorString];
}

@end
