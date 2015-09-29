//
//  AppDelegate.m
//  Demo5
//
//  Created by verec on 29/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

#import "AppDelegate.h"

#import "Demo5-Swift.h"

@implementation AppDelegate

- (BOOL) application: (UIApplication *) application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = Bindings.mainWindow ;
    self.window.rootViewController = Bindings.mainController ;
    [self.window makeKeyAndVisible] ;
    return YES ;
}

@end
