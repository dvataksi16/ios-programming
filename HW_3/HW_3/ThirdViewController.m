//
//  ThirdViewController.m
//  HW_3
//
//  Created by Denisa Vataksi on 2/28/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet UIButton *showAnswer;
@property (weak, nonatomic) IBOutlet UILabel *answer;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.answer.text =@"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showClicked:(id)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.answer.text = delegate.correctCard;
}



@end
