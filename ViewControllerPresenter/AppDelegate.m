//
//  AppDelegate.m
//  ViewControllerPresenter
//
//  Created by Nitin Seshadri on 4/17/21.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    NSLog(@"[NSWK] Application did finish launching.");
    
    _window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    NSLog(@"[NSWK] Initialized window.");
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    NSLog(@"[NSWK] Initialized storyboard.");
    
    UIViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    NSLog(@"[NSWK] Initialized main view controller.");
    
    controller.view.backgroundColor = UIColor.systemRedColor;
    
    NSLog(@"[NSWK] Set background color.");
    
    [_window setRootViewController:controller];
    
    NSLog(@"[NSWK] Set window's root VC.");
    
    [_window makeKeyAndVisible];
    
    NSLog(@"[NSWK] Hooray! The window should be visible now.");
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
