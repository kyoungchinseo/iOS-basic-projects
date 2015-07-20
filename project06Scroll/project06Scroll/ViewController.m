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
    
    //self.scrollView.delegate=self;
    // Do any additional setup after loading the view, typically from a nib.
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,
                                                               self.view.frame.size.width,
                                                               self.view.frame.size.height)];
    
    //scrollView.pagingEnabled = TRUE;
    
    NSInteger numOfImages = 22;
    for (int i=0;i<numOfImages;i++) {
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(0,
                                         self.view.frame.size.height*i,
                                         self.view.frame.size.width,
                                         self.view.frame.size.height)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg",i+1]];
        image.contentMode = UIViewContentModeScaleAspectFit;
        [scrollView addSubview:image];
    
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                        self.view.frame.size.height*numOfImages);
    
    [self.view addSubview:scrollView];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
