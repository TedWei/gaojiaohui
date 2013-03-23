//
//  MainViewController.h
//  gaojiaohui
//
//  Created by Ted on 21/3/13.
//  Copyright (c) 2013 卫 强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGFocusImageFrame.h"
#import "SGFocusImageItem.h"

@interface MainViewController : UIViewController<UIScrollViewDelegate,SGFocusImageFrameDelegate>
{
    UIButton *button1;
    UIButton *button2;
    UIButton *button3;
}

@end
