//
//  BasicShapesViewController.m
//  Graphics&Animation
//
//  Created by TimTiger on 13-11-21.
//  Copyright (c) 2013年 TimTiger. All rights reserved.
//

#import "BasicShapesViewController.h"
#import "GADrawContextView.h"

@interface BasicShapesViewController ()

@end

@implementation BasicShapesViewController

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
    [self initMode];
    [self initView];
}

#pragma mark - Set View
- (void)initView {
    drawView = [[GADrawContextView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,100)];
    [drawView setDrawType:DrawLineType];
    [self.view addSubview:drawView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, drawView.frame.origin.y+drawView.bounds.size.height, self.view.bounds.size.width,self.view.bounds.size.height-drawView.bounds.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

#pragma mark - Set Mode 
- (void)initMode {
    _dataSource = @[@"draw line",@"draw cicle",@"draw round",@"draw rectangle",@"draw image"];
}

#pragma mark - Controller
- (void) tableViewDidSelectedAtIndex:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        drawView.drawType = DrawLineType;
        [drawView setNeedsDisplay];
    } else if (indexPath.section == 0 && indexPath.row == 1) {
        drawView.drawType = DrawCircleType;
        [drawView setNeedsDisplay];
    } else if (indexPath.section == 0 && indexPath.row == 2) {
        drawView.drawType = DrawRoundType;
        [drawView setNeedsDisplay];
    } else if (indexPath.section == 0 && indexPath.row == 3) {
        drawView.drawType = DrawRectangleType;
        [drawView setNeedsDisplay];
    } else if (indexPath.section == 0 && indexPath.row == 4) {
        drawView.drawType = DrawImageType;
        [drawView setNeedsDisplay];
    }
}

#pragma memory manage
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end


@implementation BasicShapesViewController (Delegates)

#pragma mark - UITableView Delegates
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifierStr = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierStr];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self tableViewDidSelectedAtIndex:indexPath];
}

@end