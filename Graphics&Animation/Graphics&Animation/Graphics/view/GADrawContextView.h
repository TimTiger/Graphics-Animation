//
//  GADrawContextView.h
//  Graphics&Animation
//
//  Created by TimTiger on 10/31/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import "GAframework.h"


@interface GADrawContextView : UIView

@property (nonatomic,readwrite) DrawType drawType;
@property (nonatomic,retain) UIImageView *imageView;

@end
