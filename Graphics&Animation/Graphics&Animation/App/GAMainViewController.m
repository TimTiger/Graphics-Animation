//
//  GAMainViewController.m
//  Graphics&Animation
//
//  Created by ctb on 13-10-16.
//  Copyright (c) 2013年 TimTiger. All rights reserved.
//

#import "GAMainViewController.h"

@interface GAMainViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataSource;
}
@end

@implementation GAMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    [self initParameterAndData];
}

#pragma mark - viewcontroller view init
- (void)initView {
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStyleGrouped];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [self.view addSubview:tableView];
}

- (void)initParameterAndData {
    self.title = @"Graphics&Animation";
    dataSource = @[
                   @[
                    @"UIView",
                    ],
                   @[
                    @"CAnimation"
                    ],
                   ];
}

#pragma mark - UITableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [dataSource count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[dataSource objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0){
        return @"2D";
    } else if (section == 1) {
        return @"3D";
    } else {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifierString = @"IdentifierCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierString];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierString];
    }
    NSString *rowString = [[dataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    [cell.textLabel setText:rowString];
    return cell;
}

#pragma mark - UITableView Delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 1) {
        
    } else if (indexPath.section == 1 && indexPath.row == 1) {
        
    }
}

#pragma mark Memory manager
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
