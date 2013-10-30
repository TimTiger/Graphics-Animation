//
//  GACAAnimationViewController.m
//  Graphics&Animation
//
//  Created by TimTiger on 10/29/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import "GACAAnimationViewController.h"
#import "GACAAnimation.h"

@interface GACAAnimationViewController ()
{
    GACAAnimation *caanimation;
}
@end

@implementation GACAAnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initView];
    [self initModel];
    [self initController];
}
#pragma mark ---- View func
- (void)initView {
    self.title = @"CAAnimation";
    animationImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"goodboy0.png"]];
    animationImageView.bounds = CGRectMake(0, 0,50, 50);
    animationImageView.center = CGPointMake(self.view.bounds.size.width/2, self.view.frame.origin.y+40);
    [self.view addSubview:animationImageView];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, animationImageView.frame.origin.y+animationImageView.bounds.size.height+20, self.view.bounds.size.width, self.view.bounds.size.height-(animationImageView.frame.origin.y+animationImageView.bounds.size.height+20)) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark ---- Model func
- (void)initModel {
    
    tableDataSource = @[
                        @[
                            @"CABasicAnimation",
                            @"CAKeyframeAnimation",
                            @"CATransition",
                            @"CATransaction&implicit",
                            @"CATransaciton&explicit",
                            @"CAAnimationGroup"
                         ],
                        ];
    headerTitleArray = @[
                         @"CAAnimation",
                         ];
}

#pragma mark ---- Control func
- (void)initController {
    caanimation =  [[GACAAnimation alloc] init];
}
#pragma mark TableView dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [tableDataSource count];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[tableDataSource objectAtIndex:section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [headerTitleArray objectAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IdentifierCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"IdentifierCell"];
    }
    [self updateCell:cell indexPath:indexPath];
    return cell;
}

- (void)updateCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    NSString *cellTitle = [[tableDataSource objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.textLabel.text = cellTitle;
}

#pragma mark TableView Delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {
        [caanimation basicAnimationWithImageView:animationImageView];
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        [caanimation keyframeAnimationWithImageView:animationImageView];
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        [caanimation transitionAnimationWithImageView:animationImageView];
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        [caanimation implicitTransactionWithImageView:animationImageView];
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        [caanimation explicitTransactionWithImageView:animationImageView];
    } else if (indexPath.section == 0 && indexPath.row == 5) {
        [caanimation groupAnimationWithImageView:animationImageView];
    }
}

#pragma mark ----- Memory manage
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
