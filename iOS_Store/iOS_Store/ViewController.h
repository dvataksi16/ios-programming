//
//  ViewController.h
//  iOS_Store
//
//  Created by Denisa Vataksi on 2/22/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Item.h"

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>{
    int total;
    int addedCount;
}
@property(strong,nonatomic) NSMutableArray *quantity;
@property (strong, nonatomic) NSMutableArray * stock;



-(void) displayProduct: (Item *)current;

@end


