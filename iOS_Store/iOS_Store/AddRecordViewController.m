//
//  AddRecordViewController.m
//  iOS_Store
//
//  Created by Denisa Vataksi on 2/24/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "AddRecordViewController.h"
#import "Item.h"
#import "ViewController.h"
#import "StatsViewController.h"

@interface AddRecordViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *descrip;
@property (weak, nonatomic) IBOutlet UITextField *cost;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *enter;


@end

static NSInteger numOnHand;

@implementation AddRecordViewController
@synthesize quantity;
@synthesize addRecordArray;


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ViewController * homeViewController = segue.destinationViewController;
    homeViewController.stock = self.addRecordArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _pickerView.delegate = self;
    _pickerView.dataSource= self;
    quantity = [[NSMutableArray alloc]init];
    for(int i = 0; i <= 100; i++)
        [quantity addObject:[NSString stringWithFormat:@"%d",i]];
}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return quantity.count;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [self.quantity objectAtIndex:row];
}
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    numOnHand = row;
}
- (IBAction)enterAddToArray:(UIButton*)sender {
    Item * addedItem = [[Item alloc] init];
    
    
    [addedItem setName: self.name.text];
    [addedItem setDescription: self.descrip.text];
    [addedItem setCost: [self.cost.text integerValue]];
    [addedItem setNumOnHand: (int) numOnHand];
    [addedItem setImagePath: @"noimage"];
    
    
    
    [self.addRecordArray addObject: addedItem];
    [self dismissViewControllerAnimated: YES completion: nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
