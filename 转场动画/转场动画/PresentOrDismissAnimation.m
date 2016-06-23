//
//  PresentOrDismissAnimation.m
//  转场动画
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 李重阳. All rights reserved.
//

#import "PresentOrDismissAnimation.h"

@implementation PresentOrDismissAnimation


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //添加toView到上下文的视图中
    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:toViewController.view];
    
    if (self.animationType == AnimationTypePresent) {
        
        toViewController.view.transform = CGAffineTransformMakeTranslation(0, -568);
        //进行动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:.5
              initialSpringVelocity:.6
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
            
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
        
        
    }else {
        
        /* dismiss 的时候 fromView 会马上消失掉了，所以先截个屏幕**/
        UIView * snapshotView = [fromViewController.view snapshotViewAfterScreenUpdates:YES];
        [transitionContext.containerView addSubview:snapshotView];
        
        //进行动画
        [UIView animateWithDuration:[self transitionDuration:transitionContext]
                              delay:0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^{
            
            snapshotView.transform = CGAffineTransformMakeTranslation(0, 568);
            
        } completion:^(BOOL finished) {
            
            [snapshotView removeFromSuperview];
            //结束Transition
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    
}


@end
