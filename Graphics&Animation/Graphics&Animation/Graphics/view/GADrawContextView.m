//
//  GADrawContextView.m
//  Graphics&Animation
//
//  Created by TimTiger on 10/31/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

#import "GADrawContextView.h"

@implementation GADrawContextView

@synthesize drawType = _drawType,imageView = _imageView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,100, 100)];
    _imageView.center = self.center;
   // _imageView.image = [GAGraphics roundCorneredImage:[UIImage imageNamed:@"goodboy1.png"] radius:30.0f];
    [self addSubview:_imageView];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    switch (_drawType) {
        case DrawLineType:
        {
            NSMutableArray *pointsArray = [NSMutableArray arrayWithCapacity:5];
            [pointsArray addObject:[NSValue valueWithCGPoint:CGPointMake(160.0, 0.0)]];
            [pointsArray addObject:[NSValue valueWithCGPoint:CGPointMake(160.0, 300.0)]];
            [GAGraphics drawLineWithCGContextRef:context arrayPoints:pointsArray];
        }
            break;
        case DrawCircleType:
        {
            [GAGraphics drawCircleWithCGContextRef:context radius:20];
        }
            break;
        case DrawRoundType:
        {
            [GAGraphics drawRoundWithCGContextRef:context radius:20];
        }
            break;
        case DrawRectangleType:
        {
            [GAGraphics drawRectangleWithCGContextRef:context startPoint:CGPointMake(110, 10) endPoint:CGPointMake(210, 90)];
        }
            break;
        case DrawImageType:
        {
            //_imageView.image = [GAGraphics roundCorneredImage:[UIImage imageNamed:@"goodboy1.png"] radius:30];
            [GAGraphics drawImageWithCGContextRef:context rect:CGRectMake(0, 0, 45, 45) withImage:[UIImage imageNamed:@"goodboy1.png"]];
        }
            break;
        default:
            break;
    }
    
}


@end
