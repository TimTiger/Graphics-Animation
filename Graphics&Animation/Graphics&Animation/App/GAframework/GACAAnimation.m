//
//  GACAAnimationView.m
//  Graphics&Animation
//
//  Created by TimTiger on 10/29/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//



#import "GACAAnimation.h"
#import <QuartzCore/QuartzCore.h>

@implementation GACAAnimation
{
    NSInteger count;
}

- (id)init
{
    self = [super init];
    if (!self) {
        count = 0;
    }
    return self;
}

@end


@implementation GACAAnimation (CABasicAnimation)

- (void)basicAnimationWithImageView:(UIImageView *)imageView {
    
    /*keyPath types*/
    NSArray *keyPaths = @[@"transform.rotation.x",@"transform.rotation.y",@"transform.rotation.z",@"transform.rotation",@"transform.scale.x",@"transform.scale.y",@"transform.scale.z",@"transform.scale",@"transform.translation.x",@"transform.translation.y",@"transform.translation.z",@"transform.translation",];
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:[keyPaths objectAtIndex:2]]; //change keyPath value to look different animation
    shake.fromValue = [NSNumber numberWithFloat:-0.1];
    shake.toValue = [NSNumber numberWithFloat:+0.1];
    shake.duration = 0.1;
    shake.autoreverses = YES; //是否重复
    shake.repeatCount = 4;
    shake.removedOnCompletion = YES;
    [imageView.layer addAnimation:shake forKey:@"imageView"];
}

@end

@implementation GACAAnimation (CAKeyframeAnimation)

- (void)keyframeAnimationWithImageView:(UIImageView *)imageView {
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    bounceAnimation.removedOnCompletion = YES;
    bounceAnimation.duration = 1.0f;
    UIBezierPath *keyPath = [[UIBezierPath alloc]init];
    CGPoint viewCenter = CGPointMake(imageView.center.x,imageView.center.y);
    CGPoint toPoint = CGPointMake(viewCenter.x+50, viewCenter.y);
    [keyPath moveToPoint:viewCenter];
    [keyPath addLineToPoint:toPoint];
    [keyPath moveToPoint:toPoint];
    [keyPath addLineToPoint:viewCenter];
    bounceAnimation.path = [keyPath CGPath];
    [imageView.layer addAnimation:bounceAnimation forKey:@"move"];
}

@end

@implementation GACAAnimation (CATransition)

- (void)transitionAnimationWithImageView:(UIImageView *)imageView {
    CATransition *transitionAnimation = [CATransition animation];
     //transition type ,fade is default
    NSArray *typeArray = @[@"cube",@"moveIn",@"reveal",@"fade",@"pageCurl",@"pageUnCurl",@"suckEffect",@"rippleEffect",@"oglFlip"];
    transitionAnimation.type = [typeArray objectAtIndex:count%9];
    transitionAnimation.subtype = kCATransitionFromRight;
    transitionAnimation.duration = 1.0f;
    transitionAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [imageView.layer addAnimation:transitionAnimation forKey:@"transition"];
    count++;
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"goodboy%d.png",count%2]];
}

@end

@implementation GACAAnimation (CATransaction)
- (void)implicitTransactionWithImageView:(UIImageView *)imageView {
    // Obviously ,there is no animation.
    [CATransaction setDisableActions:NO]; // it doesn't work. tell me why.
    [CATransaction setAnimationDuration:3.0f];
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 50.0f;
}

- (void)explicitTransactionWithImageView:(UIImageView *)imageView {
    
    /* those code doesn't work. I don't konw the reason.
       maybe it works only in some special case.
    [CATransaction begin];
    [CATransaction setAnimationDuration:1.0f];
    [CATransaction commit];
    */
    
    [UIView beginAnimations:@"test" context:nil];
    [UIView setAnimationDuration:0.25];
    CATransform3D scale = CATransform3DMakeScale(2,2,5);
    CATransform3D rotate = CATransform3DMakeRotation(1.57f, 0, 0, 1);
    CATransform3D conbine = CATransform3DConcat(scale, rotate);
    [imageView.layer setTransform:conbine];
    [UIView commitAnimations];
}

@end

@implementation GACAAnimation (CAAnimationGroup)

- (void)groupAnimationWithImageView:(UIImageView *)imageView {
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    
    CAKeyframeAnimation *bounceAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    bounceAnimation.removedOnCompletion = YES;
    bounceAnimation.duration = 1.0f;
    UIBezierPath *keyPath = [[UIBezierPath alloc]init];
    CGPoint viewCenter = CGPointMake(imageView.center.x,imageView.center.y);
    CGPoint toPoint = CGPointMake(viewCenter.x+100, viewCenter.y);
    [keyPath moveToPoint:viewCenter];
    [keyPath addLineToPoint:toPoint];
    [keyPath moveToPoint:toPoint];
    [keyPath addLineToPoint:viewCenter];
    bounceAnimation.path = [keyPath CGPath];
    
    NSArray *keyPaths = @[@"transform.rotation.x",@"transform.rotation.y",@"transform.rotation.z",@"transform.rotation",@"transform.scale.x",@"transform.scale.y",@"transform.scale.z",@"transform.scale",@"transform.translation.x",@"transform.translation.y",@"transform.translation.z",@"transform.translation",];
    CABasicAnimation* shake = [CABasicAnimation animationWithKeyPath:[keyPaths objectAtIndex:2]]; //change keyPath value to look different animation
    shake.fromValue = [NSNumber numberWithFloat:-0.2];
    shake.toValue = [NSNumber numberWithFloat:+0.2];
    shake.duration = 0.1;
    //shake.beginTime = 1.0f;  // set beginTime can execute the animations in any order.
    shake.autoreverses = YES; //is repeat
    shake.repeatCount = 10;
    shake.removedOnCompletion = YES;
    
    groupAnimation.duration = 2.0f;
    groupAnimation.animations = @[bounceAnimation,shake,];
    //groupAnimation.fillMode = kCAFillModeForwards;
    [imageView.layer addAnimation:groupAnimation forKey:@"group"];
}

@end
