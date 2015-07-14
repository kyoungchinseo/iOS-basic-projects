//
//  SecondViewController.h
//  project03view
//
//  Created by Kyoungchin Seo on 2015. 6. 27..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property NSArray *_personData;
@property (weak, nonatomic) IBOutlet UIButton *buttonFind;
@property (weak, nonatomic) IBOutlet UIButton *buttonDisplayList;
@property (weak, nonatomic) IBOutlet UITextField *textFieldInput;
@property (weak, nonatomic) IBOutlet UILabel *labelResult;


@end

