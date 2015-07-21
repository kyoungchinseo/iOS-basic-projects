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
@synthesize currentIndexToShow;
@synthesize prevIndexToShow;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupScrollInfo];
    
    [self initScrollView];
    
    [self.view addSubview:scrollView];
}

- (void)initScrollView {
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,
                                                               self.view.frame.size.width,
                                                               self.view.frame.size.height)];
    scrollView.delegate = self;
    
    NSInteger numOfImages = 22;
    
    currentIndexToShow = [self getIndexOfImageForDisplay];
    // if we know the value
    int strIndex = [[currentIndexToShow objectAtIndex:0] intValue];
    int endIndex = [[currentIndexToShow objectAtIndex:1] intValue];
    NSLog(@"get %d %d",strIndex, endIndex);
    
    
    // init imageCacheArray
    imageCacheArray = [[NSMutableArray alloc] init];
    for (int i=0; i<numOfImages; i++) {
        NSNull *nullValue = [NSNull null];
       [imageCacheArray addObject: nullValue];
    }
    
    for (int i=strIndex; i<=endIndex;i++) {
        [imageCacheArray removeObjectAtIndex:i];
        
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg",i+1]];
        UIImageView *image = [[UIImageView alloc] initWithFrame:
                              CGRectMake(0,
                                         [[imageInfo objectAtIndex: i] floatValue],
                                         self.view.frame.size.width,
                                         img.size.height*(self.view.frame.size.width / img.size.width))];
        image.image = img;
        image.contentMode = UIViewContentModeScaleAspectFit;
        
        [imageCacheArray insertObject:image atIndex:i];
    }
    
    for (int i=strIndex;i<=endIndex;i++) {
        [scrollView addSubview: [imageCacheArray objectAtIndex:i]];
    }
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width,
                                        [[imageInfo lastObject]floatValue]);
    
    //
    prevIndexToShow = currentIndexToShow;
}

- (void)setupScrollInfo {
    NSInteger numOfImages = 22;
    
    NSMutableArray *info = [[NSMutableArray alloc]init];
    
    float accHeight = 0.0;
    for (int i=0;i<numOfImages;i++) {
        
        [info addObject: [NSNumber numberWithFloat:accHeight]];
        
        // pre-loading to calculating resized height of image
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg",i+1]];
        
        accHeight += img.size.height * (self.view.frame.size.width / img.size.width);
    }
    
    // add total size of scroll view to last object
    [info addObject: [NSNumber numberWithFloat:accHeight]];
    
    imageInfo = [[NSArray alloc]initWithArray:info];
}

- (NSArray *)getIndexOfImageForDisplay {
    float str = scrollView.bounds.origin.y;
    float end = scrollView.bounds.origin.y + self.view.frame.size.height;
    
    int strIndex = 0;
    int endIndex = 0;
    
    for (int i=0; i < [imageInfo count]-1; i++) {
        if ((str >= [[imageInfo objectAtIndex:i]floatValue]) && (str <= [[imageInfo objectAtIndex: i+1] floatValue])) {
            //NSLog(@"str=%d",i);
            strIndex = i;
        }
        if ((end >= [[imageInfo objectAtIndex:i]floatValue]) && (end <= [[imageInfo objectAtIndex: i+1] floatValue])) {
            //NSLog(@"end=%d",i);
            endIndex = i;
        }
    }
    
    return [[NSArray alloc] initWithObjects:[NSNumber numberWithInt: strIndex], [NSNumber numberWithInt: endIndex], nil];
    
}

- (void)updateScrollView {
    currentIndexToShow = [self getIndexOfImageForDisplay];
    // if we know the value
    
    if (currentIndexToShow == prevIndexToShow) {
        // no update
        return;
    }
    
    // if update is necessary,
    int strIndex = [[currentIndexToShow objectAtIndex:0] intValue];
    int endIndex = [[currentIndexToShow objectAtIndex:1] intValue];
    
    for (int i=0; i<[imageCacheArray count]; i++) {
        if ((i >= strIndex) && (i <= endIndex)) { // inside the range to show images on screen
            if ([[imageCacheArray objectAtIndex:i] isEqual:[NSNull null]]) {
                
            
                [imageCacheArray removeObjectAtIndex:i];
            
                UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%02d.jpg",i+1]];
                UIImageView *image = [[UIImageView alloc] initWithFrame:
                                      CGRectMake(0,
                                                 [[imageInfo objectAtIndex: i] floatValue],
                                                 self.view.frame.size.width,
                                                 img.size.height*(self.view.frame.size.width / img.size.width))];
                image.image = img;
                image.contentMode = UIViewContentModeScaleAspectFit;
            
                [imageCacheArray insertObject:image atIndex:i];
            }
        } else { // outside the range to show images on screen
            if (![[imageCacheArray objectAtIndex:i] isEqual:[NSNull null]]) {
                [imageCacheArray removeObjectAtIndex:i];
                NSNull *nullValue = [NSNull null];
                [imageCacheArray insertObject:nullValue atIndex: i];
            }
        }
    }
    
    for (int i=strIndex;i<=endIndex;i++) {
        [scrollView addSubview: [imageCacheArray objectAtIndex:i]];
    }
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
    NSLog(@"you are scrolling!");
    
    [self getIndexOfImageForDisplay];
    [self updateScrollView];
}

// after scrolling (END)
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrolling is finished");
}



@end
