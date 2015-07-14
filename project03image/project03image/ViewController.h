//
//  ViewController.h
//  project03image
//
//  Created by Kyoungchin Seo on 2015. 7. 5..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ImageModel.h"



@interface ViewController : UIViewController


@property ImageModel *imageModel;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewController;
@property (weak, nonatomic) IBOutlet UILabel *textTitle;

@property (weak, nonatomic) IBOutlet UIButton *buttonRandom;

- (IBAction)chageImage:(id)sender;

@end

