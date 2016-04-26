//
//  DrawerMenuViewController.m
//  MyAscent  Author Parag Deshapnde
//
//  Created by KloudData on 12/1/15.
//  Copyright (c) 2015 KloudData. All rights reserved.
//

#import "DrawerController.h"
#import "TableViewController.h"
#define TAG_MENU_VIEW                 101
#define TAG_TABLE_VIEW_MENU           102

static DrawerController *myDrawerObj;

@interface DrawerController ()

@end

@implementation DrawerController
@synthesize maxVisibleWidth;
@synthesize sourceController;
@synthesize destinationController;
@synthesize isDrawerOpen;

+(DrawerController*)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      myDrawerObj = [[DrawerController alloc] init];
                  }
                  );
    return myDrawerObj;
}

-(id)init
{

    self = [super init];
    if (self)
    {
        destinationController = [[TableViewController alloc]init];
        
    }
    return self;
}

-(void)dealloc
{
    destinationController = nil;
    sourceController = nil;
}

-(void)drawerTouched
{

    if (isDrawerOpen)
    {
        [self closeDrawer];
    }
    else
    {
        [self openDrawer];
    }
    
}

-(void)openDrawer
{
    isDrawerOpen = YES;

    UIViewController *src = self.sourceController;
    TableViewController *dst =  (TableViewController*)self.destinationController;
    
    [src addChildViewController:dst];
    [src.view addSubview:dst.view];
    [dst didMoveToParentViewController:src];
//    
//    UIView *view = dst.view;
//    UIView* menuView =  [view viewWithTag:TAG_MENU_VIEW];
//  
//    UITableView *tableView = (UITableView*)[menuView viewWithTag:TAG_TABLE_VIEW_MENU];
    src.view.alpha = 0.9;
  
    [dst.tableview setFrame:CGRectMake(0, 85, 0, dst.view.frame.size.height)];

    [UIView animateWithDuration:0.5 animations:^{
        [dst.tableview setFrame:CGRectMake(0, 85, maxVisibleWidth, src.view.frame.size.height)];
    }];

}

-(void)closeDrawer
{
    
    if (sourceController)
    {
        UIViewController *src = self.sourceController;
        TableViewController *dst =  (TableViewController*)self.destinationController;
        
//        UIView *view = dst.view;
//        UIView* menuView =  [view viewWithTag:TAG_MENU_VIEW];
//        UITableView *tableView = (UITableView*)[menuView viewWithTag:TAG_TABLE_VIEW_MENU];

        src.view.alpha = 1.0;

        [dst.tableview setFrame:CGRectMake(0, 85, maxVisibleWidth, dst.view.frame.size.height)];
        
        [UIView animateWithDuration:0.5 animations:^{
            [dst.tableview setFrame:CGRectMake(0, 85, 0, src.view.frame.size.height)];
        } completion:^(BOOL finished)
         {
             [dst removeFromParentViewController];
             [dst.view removeFromSuperview];
         }];
        
    }
    isDrawerOpen = NO;
    
}




@end
