//
//  DrawerMenuViewController.h
//  MyAscent  Author Parag Deshapnde
//
//  Created by KloudData on 12/1/15.
//  Copyright (c) 2015 KloudData. All rights reserved.
//

#import "BaseViewController.h"
#import "ViewController.h"
@class TableViewController;

@interface DrawerController : NSObject

@property(nonatomic,assign) NSUInteger  maxVisibleWidth;

@property(strong,nonatomic) UIViewController *sourceController;
@property(strong,nonatomic) TableViewController *destinationController;

@property(nonatomic,assign) BOOL            isDrawerOpen;

+(DrawerController*)sharedInstance;

-(void)drawerTouched;


@end
