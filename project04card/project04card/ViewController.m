//
//  ViewController.m
//  project04card
//
//  Created by Kyoungchin Seo on 2015. 7. 8..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "ViewController.h"
#import "CardDeck.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(newCardEventHandler:) name:@"NewCard" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeCard:(id)sender {
    CardDeck *cardDeck = [[CardDeck alloc]init];
    [cardDeck randomize];
}

- (void) newCardEventHandler: (NSNotification *)notification
{
    NSLog(@"new card info from notification is %@",[notification object]);
    
    NSString *fileName = [NSString stringWithFormat:@"%@.png",[notification object]];
                          
    NSLog(@"%@",fileName);
    
    
    _imageView.image = [UIImage imageNamed:fileName];

    
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [self becomeFirstResponder];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (event.type == UIEventSubtypeMotionShake) {
        CardDeck *cardDeck = [[CardDeck alloc]init];
        [cardDeck randomize];
    }
}



@end
