//
//  BasicShapesViewController.h
//  Graphics&Animation
//
//  Created by TimTiger on 13-11-21.
//  Copyright (c) 2013年 TimTiger. All rights reserved.
//

#import "GAframework.h"

@class GADrawContextView;
@interface BasicShapesViewController : GAViewController
{
    //view
    GADrawContextView *drawView;
    UITableView *_tableView;
    
    //mode
    NSArray *_dataSource;
}
@end

@interface BasicShapesViewController (Delegates) <UITableViewDataSource,UITableViewDelegate>

@end
