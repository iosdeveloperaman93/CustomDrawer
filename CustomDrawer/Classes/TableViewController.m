//
//  TableViewController.m
//  ViewSlideDemo
//
//  Created by Aman Gangurde on 25/04/16.
//  Copyright © 2016 KloudData Inc. All rights reserved.
//

#import "TableViewController.h"
#define CELL_IDENTIFIER           @"cellIdentifier"
#import "SeconViewController.h"
#import "AppDelegate.h"
#import "DrawerController.h"

@interface TableViewController ()<UITableViewDataSource, UITableViewDelegate>
{
  NSArray *controllers;
  SeconViewController *seconViewControllerObj;
  UIView *nav;
}
@end

@implementation TableViewController
@synthesize tableview;
- (void)viewDidLoad {
    [super viewDidLoad];

//  UIView *viewBack = [[UIView alloc]init];
//  viewBack.frame = self.view.bounds;
//  viewBack.backgroundColor = [UIColor blackColor];
//  viewBack.alpha = 0.5;
//  [self.view addSubview:viewBack];
  
  
  tableview = [[UITableView alloc]init];
  tableview.backgroundColor = [UIColor orangeColor];
  tableview.delegate = self;
  tableview.dataSource = self;
  tableview.scrollEnabled = NO;
  
  tableview.layer.shadowColor = [UIColor blackColor].CGColor;
  tableview.layer.shadowOffset = CGSizeMake(90.0f, 90.0f);
  tableview.layer.shadowOpacity = 1.0f;
  
  [self.view addSubview:tableview];
  
  controllers = [[NSArray alloc]initWithObjects:@"file Manager",@"Task",@"Utils",@"Widgets",@"Notes", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  AppDelegate *appObj = (AppDelegate*)[UIApplication sharedApplication].delegate;
  seconViewControllerObj = [[SeconViewController alloc]init];
  [appObj.mainNavigationController pushViewController:seconViewControllerObj animated:YES];
  
 [[DrawerController sharedInstance] drawerTouched];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return controllers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
  
  cell.backgroundColor = [UIColor lightGrayColor];
  
  if (cell == nil)
  {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CELL_IDENTIFIER];
  }
  
  cell.textLabel.text = controllers[indexPath.row];
  
  cell.detailTextLabel.text = @"details";
  
  return cell;
}

@end
