//
//  SecondViewController.m
//  project03view
//
//  Created by Kyoungchin Seo on 2015. 6. 27..
//  Copyright (c) 2015년 nhnnext. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController


@synthesize _personData;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _personData = @[ @{@"name":@"이진우",@"number":@131056},
                     @{@"name":@"김창규",@"number":@131020},
                     @{@"name":@"박태준",@"number":@141037},
                     @{@"name":@"심보희",@"number":@141051},
                     @{@"name":@"고형진",@"number":@141004},
                     @{@"name":@"조영대",@"number":@141083},
                     @{@"name":@"조현호",@"number":@141085},
                     @{@"name":@"신윤서",@"number":@141049} ];
    self.labelResult.text = @"결과:";
    self.textFieldInput.text = @"";

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)findNumber:(id)sender {
    //self.labelResult.text = self.textFieldInput.text;
    self.labelResult.text = [NSString stringWithFormat:@"결과: %@",self.textFieldInput.text];
    bool findFlag = false;
    if ([self.textFieldInput.text isEqual: @""]) {
        self.labelResult.text = [NSString stringWithFormat:@"결과: %@",@"검색 이름 입력"];
        
    } else {
        for (int i=0; i<[_personData count]; i++) {
            if ([[_personData[i] objectForKey:@"name"] isEqual: self.textFieldInput.text]) {
                findFlag = true;
                self.labelResult.text = [NSString stringWithFormat:@"결과: %@",[_personData[i] objectForKey:@"number"]];
            }
        }
        if (findFlag == false) {
            self.labelResult.text = [NSString stringWithFormat:@"결과: %@",@"검색결과 없음"];
        }
    }
}

- (IBAction)showNameList:(id)sender {
    //self.labelResult.text = @"검색결과 프린트";
    NSMutableString *msg = [[NSMutableString alloc]init];
    for(int i=0;i<[_personData count];i++) {
        NSLog(@"%@", [_personData[i] objectForKey:@"name"]);
        [msg appendString:[_personData[i] objectForKey:@"name"]];
        if (i<[_personData count]-1) {
            [msg appendString:@","];
        }
    }
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"전체이름"
                                  message: msg
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    [alert addAction:ok];    
    [self presentViewController:alert animated:YES completion:nil];
}



@end
