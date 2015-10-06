//
//  AppDelegate.m
//  Demo7
//
//  Created by verec on 04/10/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

#import "AppDelegate.h"

#import "Demo7-Swift.h"

@implementation AppDelegate

- (BOOL) application: (UIApplication *) application
didFinishLaunchingWithOptions: (NSDictionary *) launchOptions {

    self.window                         = [Instances mainWindow] ;
    self.window.rootViewController      = [Instances mainController] ;
    self.window.rootViewController.view = [Instances mainView] ;

    [[Instances wireboard] rewire] ;
    
    [self.window makeKeyAndVisible] ;
    
    return YES ;
}

@end
