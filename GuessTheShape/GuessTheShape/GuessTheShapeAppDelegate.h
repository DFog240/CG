//
//  GuessTheShapeAppDelegate.h
//  CG
//
//  Created by Dylan Foglesong on 6/30/13.
//  Copyright 2013 Dylan Foglesong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"
@interface GuessTheShapeAppDelegate : NSObject <UIApplicationDelegate> {
    RootViewController *viewController;
}

@property (nonatomic, retain) RootViewController *viewController;
@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
