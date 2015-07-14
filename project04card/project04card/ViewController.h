//
//  ViewController.h
//  project04card
//
//  Created by Kyoungchin Seo on 2015. 7. 8..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *buttonNewCard;
- (IBAction)changeCard:(id)sender;

@end

