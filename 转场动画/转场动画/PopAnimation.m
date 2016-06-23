//
//  PopAnimation.m
//  转场动画
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 李重阳. All rights reserved.
//

#import "PopAnimation.h"


@implementation PopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 1.0;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //添加toView到上下文的视图中
    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toViewController.view];
    [containerView bringSubviewToFront:fromViewController.view];
    
    toViewController.view.transform = CGAffineTransformMakeTranslation(-320, -568);
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
                         
                         toViewController.view.transform = CGAffineTransformIdentity;
                         fromViewController.view.transform = CGAffineTransformMakeTranslation(320, 568);
                         
                     } completion:^(BOOL finished) {
                         
                         fromViewController.view.transform = CGAffineTransformIdentity;
                         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                         
    }];
    
    
}


@end
