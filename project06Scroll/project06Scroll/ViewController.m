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

@synthesize imageCacheArray;
@synthesize imageInfo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollInfo];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initScrollView];
    
    [self.view addSubview:scrollView];
}

- (void)initScrollView {
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,
                                                               self.view.frame.size.width,
                                                               self.view.frame.size.height)];
    scrollView.delegate = self;
    
    NSInteger numOfImages = 22;
    
    [self getIndexOfImageForDisplay];
    
    for (int i=0;i<numOfImages;i++) {
        
        // pre-loading to calculating resized height of image
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg",i+1]];
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(0,
                                         [[imageInfo objectAtIndex: i] floatValue],
                                         self.view.frame.size.width,
                                         img.size.height*(self.view.frame.size.width / img.size.width))];
        image.image = img;
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        [scrollView addSubview:image];
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                        [[imageInfo lastObject]floatValue]);
    
    
}

- (void)setupScrollInfo {
    NSInteger numOfImages = 22;
    
    NSMutableArray *info = [[NSMutableArray alloc]init];
    
    float accHeight = 0.0;
    for (int i=0;i<numOfImages;i++) {
        
        [info addObject: [NSNumber numberWithFloat:accHeight]];
        
        // pre-loading to calculating resized height of image
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg",i+1]];
        
        //UIImageView *image = [[UIImageView alloc] initWithFrame:
        //                      CGRectMake(0,
        //                                 accHeight,
        //                                 self.view.frame.size.width,
        //                                 img.size.height*(self.view.frame.size.width / img.size.width))];
        //image.image = img;
        //image.contentMode = UIViewContentModeScaleAspectFit;
        
        accHeight += img.size.height * (self.view.frame.size.width / img.size.width);
        
    }
    
    // add total size of scroll view to last object
    [info addObject: [NSNumber numberWithFloat:accHeight]];
    
    imageInfo = [[NSArray alloc]initWithArray:info];
    
    // init imageCacheArray
    imageCacheArray = [[NSMutableArray alloc] init];
    
}

- (void)getIndexOfImageForDisplay {
    float str = scrollView.bounds.origin.y;
    float end = scrollView.bounds.origin.y + self.view.frame.size.height;
    NSLog(@"cureent = %f %f",str,end);
}

- (void)updateScrollView {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// before scrolling
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"Before scroll");
    
}

// when scroll is happening
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"you are scrolling!");
    //NSLog(@"x= %f y= %f w= %f h= %f",scrollView.bounds.origin.x, scrollView.bounds.origin.y, scrollView.bounds.size.width, scrollView.bounds.size.height);
    
    
}

// after scrolling (END)
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrolling is finished");
}



@end
