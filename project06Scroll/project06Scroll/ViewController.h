//
//  ViewController.h
//  project06Scroll
//
//  Created by Kyoungchin Seo on 2015. 7. 15..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    
}

@property NSMutableArray *imageCacheArray;
@property NSArray *imageInfo;

- (void)setupScrollInfo;
- (void)initScrollView;
- (void)updateScrollView;



@end

