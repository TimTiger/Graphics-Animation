//
//  GACAAnimationViewController.h
//  Graphics&Animation
//
//  Created by TimTiger on 10/29/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import "GAframework.h"

@interface GACAAnimationViewController : GAViewController <UITableViewDelegate,UITableViewDataSource>
{
    UIImageView *animationImageView;
    UITableView *_tableView;
    
    NSArray *tableDataSource;
    NSArray *headerTitleArray;
}
@end
