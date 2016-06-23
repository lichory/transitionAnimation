//
//  PushAnimation.m
//  转场动画
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 李重阳. All rights reserved.
//

#import "PushAnimation.h"


@implementation PushAnimation

/* 动画持续的时间 **/
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 1.0;
}

/*动画交互 **/
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //添加toView到上下文的视图中
    UIView * containerView = [transitionContext containerView];
    /* 加入 目的 控制器的View**/
    [containerView addSubview:toViewController.view];
    [containerView bringSubviewToFront:fromViewController.view];
    
    //自定义动画
    toViewController.view.transform = CGAffineTransformMakeTranslation(-320, 0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                     animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeTranslation(320, 0);
        toViewController.view.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
            
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
    }];

}


@end
