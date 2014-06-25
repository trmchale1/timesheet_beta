//
//  V2AppDelegate.m
//  timesheet_beta
//
//  Created by Tim McHale on 6/25/14.
//  Copyright (c) 2014 Tim McHale. All rights reserved.
//

#import "V2AppDelegate.h"
#import "things.h"
#import "V2ViewControllerTableViewController.h"

@implementation V2AppDelegate
{
    NSMutableArray *_things;
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _things = [NSMutableArray arrayWithCapacity:20];
    
    things *thing = [[things alloc] init];
    thing.name = @"Bill Evans";
    thing.game = @"Tic-Tac-Toe";
    thing.rating = 4;
    [_things addObject:thing];
    
    thing = [[things alloc] init];
    thing.name = @"Oscar Peterson";
    thing.game = @"Spin the Bottle";
    thing.rating = 5;
    [_things addObject:thing];
    
    thing = [[things alloc] init];
    thing.name = @"Dave Brubeck";
    thing.game = @"Texas Hold’em Poker";
    thing.rating = 2;
    [_things addObject:thing];
    
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [[tabBarController viewControllers] objectAtIndex:1];
    V2ViewControllerTableViewController *V2ViewControllerTableViewController = [[navigationController viewControllers] objectAtIndex:0];
   V2ViewControllerTableViewController.things = _things;
    
   
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end