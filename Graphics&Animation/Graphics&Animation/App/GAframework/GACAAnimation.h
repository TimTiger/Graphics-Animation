//
//  GACAAnimationView.h
//  Graphics&Animation
//
//  Created by TimTiger on 10/29/13.
//  Copyright (c) 2013 TimTiger. All rights reserved.
//

/*
 CAAnimation的一些派生类:
 CATransition 提供渐变效果:(推拉push效果,消退fade效果,揭开reveal效果)
 CAAnimationGroup 允许多个动画同时播放
 CABasicAnimation 提供了对单一动画的实现
 CAKeyframeAnimation 关键桢动画,可以定义行动路线
 CAConstraint 约束类,在布局管理器类中用它来设置属性
 CAConstraintLayoutManager 约束布局管理器,是用来将多个CALayer进行布局的.各个CALayer是通过名称来区分,而布局属性是通过CAConstraint来设置的.
 CATransaction 事务类,可以对多个layer的属性同时进行修改.它分隐式事务,和显式事务.
 */

#import <UIKit/UIKit.h>

@interface GACAAnimation : NSObject
{

}
@end

@interface GACAAnimation (CATransition)
- (void)transitionAnimationWithImageView:(UIImageView *)imageView;
@end

@interface GACAAnimation (CAAnimationGroup)
- (void)groupAnimationWithImageView:(UIImageView *)imageView;
@end

@interface GACAAnimation (CABasicAnimation)

- (void)basicAnimationWithImageView:(UIImageView *)imageView;
@end

@interface GACAAnimation (CAKeyframeAnimation)
- (void)keyframeAnimationWithImageView:(UIImageView *)imageView;
@end

@interface GACAAnimation (CATransaction)
- (void)implicitTransactionWithImageView:(UIImageView *)imageView;
- (void)explicitTransactionWithImageView:(UIImageView *)imageView;
@end