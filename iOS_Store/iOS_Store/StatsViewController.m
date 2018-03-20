//
//  StatsViewController.m
//  iOS_Store
//
//  Created by Denisa Vataksi on 2/26/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "StatsViewController.h"
#import "ViewController.h"


@interface StatsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *home;
@property (weak, nonatomic) IBOutlet UILabel *current;
@property (weak, nonatomic) IBOutlet UILabel *newlyAddedProds;


@end
@implementation StatsViewController
static int totalProducts;
static int addedCount;

- (void) setTotal: (int)total {
    totalProducts = total;
}

- (void) setNewlyAdded:(int)newlyAdded {
    addedCount = newlyAdded;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.current.text = [NSString stringWithFormat:@"%d", totalProducts];
    self.newlyAddedProds.text = [NSString stringWithFormat:@"%d", addedCount];

    
}
- (IBAction)goBack:(id)sender {
    [self dismissViewControllerAnimated: YES completion: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
