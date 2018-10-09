//
//  ViewController.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "ViewController.h"
#import "LMUtilsHeaders.h"

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIButton *button;

@property (nonatomic, weak) IBOutlet UIButton *alertButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _button.acceptEventInterval = 1.0;
    [UIAlertAction setDefaultTitleColor:[UIColor redColor]];
    [UIAlertController setDefaultColor:[UIColor greenColor]];
    
    [UIImage imageNamed:nil];
    
    LMLog(@"%@",[UIColor colorWithHex:0xFFFFFF]);
    
   
    
    
    
    
}


- (IBAction)buttonAction:(id)sender {
    NSLog(@"%@",[NSDate date]);
}


- (IBAction)showAlertController:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title color"
                                                                             message:@"message"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    // action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:cancelAction];
    
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
    }];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
