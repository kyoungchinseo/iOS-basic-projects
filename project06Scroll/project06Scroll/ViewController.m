//
//  ViewController.m
//  project06Scroll
//
//  Created by Kyoungchin Seo on 2015. 7. 15..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,
                                                               self.view.frame.size.width,
                                                               self.view.frame.size.height)];
    
    NSInteger numOfImages = 22;
    float accHeight = 0.0;
    for (int i=0;i<numOfImages;i++) {
        // pre-loading to calculating resized height of image
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg",i+1]];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(0,
                                         accHeight,
                                         self.view.frame.size.width,
                                         img.size.height*(self.view.frame.size.width / img.size.width))];
        image.image = img;
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        accHeight += img.size.height * (self.view.frame.size.width / img.size.width);
        
        [scrollView addSubview:image];
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                        accHeight);
    
    [self.view addSubview:scrollView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
