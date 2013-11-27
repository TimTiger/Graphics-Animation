//
//  GAViewController.m
//  Graphics&Animation
//
//  Created by TimTiger on 10/29/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import "GAViewController.h"

@interface GAViewController ()

@end

@implementation GAViewController

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
    if (__SYS_VERSION__ >= 7.0f) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

- (void)pushViewController:(GAViewController *)vc animated:(BOOL)animatied {
    [self.navigationController pushViewController:vc animated:animatied];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
