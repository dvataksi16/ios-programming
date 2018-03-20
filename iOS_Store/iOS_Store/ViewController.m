//
//  ViewController.m
//  iOS_Store
//
//  Created by Denisa Vataksi on 2/22/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "ViewController.h"
#import "Item.h"
#import "AddRecordViewController.h"
#import "StatsViewController.h"

//@property (strong, nonatomic) Item *item;

//next and add buttons

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *product;
@property (weak, nonatomic) IBOutlet UITextField *descrip;
@property (weak, nonatomic) IBOutlet UITextField *cost;
@property (weak, nonatomic) IBOutlet UIButton *backward;
@property (weak, nonatomic) IBOutlet UIButton *forward;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UIButton *addRecord;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

int indexOfStock = 0;
static Item* current;
static int addedCount;

@implementation ViewController
@synthesize quantity;
@synthesize stock;

-(void) displayProduct: (Item*) current {
    self.product.text = [current getName];
    self.descrip.text = [current getDescription];
    self.cost.text = [NSString stringWithFormat: @"%.2f",[current getCost] ];
    [self.pickerView selectRow:[current getNumOnHand] inComponent:0 animated:YES];
    [_slider setValue:indexOfStock animated:YES];
    [self changeButtonState];
    
    [self.imageView removeFromSuperview];
    _imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: [current getImagePath]]];
    _imageView.frame = CGRectMake(45, 90, 300, 150);
    [self.view addSubview: _imageView];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   if([segue.identifier isEqualToString:(@"addRecordsView")]){
        AddRecordViewController *addRecordViewController = segue.destinationViewController;
        addRecordViewController.addRecordArray = self.stock;
       addedCount ++;
    } else if([segue.identifier isEqualToString:(@"stats")]){
       StatsViewController *statsViewController = segue.destinationViewController;
        
        [statsViewController setTotal: (int)self.stock.count];
        [statsViewController setNewlyAdded:addedCount];
   }
}


- (IBAction)addRecordClicked:(UIStoryboardSegue *)segue {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _pickerView.delegate = self;
    _pickerView.dataSource= self;
    quantity = [[NSMutableArray alloc]init];
    for(int i = 0; i <= 100; i++)
        [quantity addObject:[NSString stringWithFormat:@"%d",i]];
    
    stock = [[NSMutableArray alloc] init];
    
    //iphone
    Item *iphoneX = [[Item alloc] init];
    [iphoneX setName: @"iPhone X"];
    [iphoneX setDescription: @"iPhone X released Fall 2017"];
    [iphoneX setCost: 969];
    [iphoneX setNumOnHand: 2];
    [iphoneX setImagePath: @"iphonex"];
    [stock addObject: iphoneX];
    
    //galaxy phone
    Item *galaxy = [[Item alloc] init];
    [galaxy setName: @"Galaxy Note 7"];
    [galaxy setDescription: @"Samsung's Exploding Phone"];
    [galaxy setCost: 850];
    [galaxy setNumOnHand: 90];
    [galaxy setImagePath: @"galaxy"];
    [stock addObject: galaxy];
    
    //tv
    Item *tv = [[Item alloc] init];
    [tv setName: @"40-inch TV"];
    [tv setDescription: @"Sony's LED TV"];
    [tv setCost: 298];
    [tv setNumOnHand: 89];
    [tv setImagePath: @"tv40"];
    [stock addObject: tv];
    
    //kindle
    Item *kindle = [[Item alloc] init];
    [kindle setName: @"Kindle Reader"];
    [kindle setDescription: @"Amazon's E-Reader"];
    [kindle setCost: 79.99];
    [kindle setNumOnHand: 100];
    [kindle setImagePath: @"kindle"];
    [stock addObject: kindle];
    
    //apple watch
    Item *appleWatch = [[Item alloc] init];
    [appleWatch setName: @"Apple Watch"];
    [appleWatch setDescription: @"Series 3 - Vibranium Case"];
    [appleWatch setCost: 299];
    [appleWatch setNumOnHand: 0];
    [appleWatch setImagePath: @"apple_watch"];
    [stock addObject: appleWatch];
    
    addedCount = 0;
    [self.slider setMaximumValue: stock.count - 1];
    [self.slider setMinimumValue: 0];
    [_slider setContinuous:YES];
    
    [self displayProduct: stock.firstObject];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.slider setMaximumValue: stock.count - 1];
}

- (IBAction) displayChanged :(UISlider *)sender {
    indexOfStock = (int)(sender.value);
    [self displayProduct:stock[indexOfStock]];
}

- (void) changeButtonState {
    [self.forward setEnabled:indexOfStock != stock.count - 1];
    [self.backward setEnabled:indexOfStock != 0];
}

- (IBAction)forwardClick:(UIButton *)sender {
    indexOfStock++;
    [self displayProduct: stock[indexOfStock]];  

}
- (IBAction)backwardClick:(UIButton *)sender {
    indexOfStock--;
    [self displayProduct: stock[indexOfStock]];
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *) pickerView {
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return quantity.count;
}
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
        return [quantity objectAtIndex:row];
}



@end
