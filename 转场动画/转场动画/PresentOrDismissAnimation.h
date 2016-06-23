//
//  PresentOrDismissAnimation.h
//  转场动画
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 李重阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    
    AnimationTypePresent,
    AnimationTypeDismiss
    
} AnimationType;


@interface PresentOrDismissAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) AnimationType animationType;

@end
