//
//  ViewController.m
//  project03image
//
//  Created by Kyoungchin Seo on 2015. 7. 5..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *FilePath = [[NSBundle mainBundle]pathForResource:@"modeldata" ofType:@"txt"];
    
    imageModel = [[ImageModel alloc]initWithPathName:FilePath];
    
    NSDictionary *item;
    for (int i=0;i<imageModel.imageList.count;i++) {
        item = [imageModel itemAtIndex:i];
        NSLog(@"%@", [item objectForKey:@"title"]);
        NSLog(@"%@", [item objectForKey:@"image"]);
    }
    
    
    //_imageViewController = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 240)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)chageImage:(id)sender {
    NSLog(@"Changed:");
    NSUInteger index = arc4random() % [imageModel countOfImageList];
    
    //NSLog(@"%lu",(unsigned long)index);
    
    _textTitle.text = [NSString stringWithFormat:@"제목: %@",[[imageModel itemAtIndex:(int)index] objectForKey:@"title"]];
    
    
    _imageViewController.image = [UIImage imageNamed: [[imageModel itemAtIndex:(int)index]objectForKey:@"image"]];
    
    _imageViewController.contentMode = UIViewContentModeScaleAspectFill;
//    //change width of frame
//    CGRect frame = _imageViewController.frame;
//    frame.size.width = 320;
//    _imageViewController.frame = frame;
//    [self.view addSubview:_imageViewController];
}

@end
