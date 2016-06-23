//
//  ViewController.m
//  转场动画
//
//  Created by apple on 16/6/22.
//  Copyright © 2016年 李重阳. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "PushAnimation.h"
#import "PopAnimation.h"
#import "ViewController3.h"
#import "PresentOrDismissAnimation.h"

/*
 * UIViewControllerTransitioningDelegate: 用户转场动画
 **/
@interface ViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>


@property (nonatomic,strong) PushAnimation * pushAnimation;

@property (nonatomic,strong) PopAnimation  * popAnimation;

@property (nonatomic,strong) PresentOrDismissAnimation * presentOrDismissAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationController.delegate = self;
    
    _pushAnimation = [[PushAnimation alloc]init];
    _popAnimation  = [[PopAnimation alloc]init];
    _presentOrDismissAnimation = [[PresentOrDismissAnimation alloc]init];
    
}

// 动画特效

- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    /**
     
     *  typedef NS_ENUM(NSInteger, UINavigationControllerOperation) {
     
     *     UINavigationControllerOperationNone,
     
     *     UINavigationControllerOperationPush,
     
     *     UINavigationControllerOperationPop,
     
     *  };
     
     */
    //push的时候用我们自己定义的customPush
    if (operation == UINavigationControllerOperationPush) {
        
        return _pushAnimation;
        
    }else if (operation == UINavigationControllerOperationPop) {
        
        return _popAnimation;
    }else{
        
        return nil;
        
    }
    
}

- (IBAction)present:(id)sender {
    
    UIStoryboard * storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController3 * vc3 = [storyboard instantiateViewControllerWithIdentifier:@"ViewController3"];
    vc3.transitioningDelegate = self;
    [self presentViewController:vc3 animated:YES completion:nil];
    
}

#pragma mark - UIViewControllerTransitioningDelegate

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    _presentOrDismissAnimation.animationType = AnimationTypePresent;
    return _presentOrDismissAnimation;
    
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {

    _presentOrDismissAnimation.animationType = AnimationTypeDismiss;
    return _presentOrDismissAnimation;
}



@end
