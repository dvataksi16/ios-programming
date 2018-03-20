//
//  AddRecordViewController.h
//  iOS_Store
//
//  Created by Denisa Vataksi on 2/24/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface AddRecordViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
@property(strong,nonatomic) NSMutableArray *quantity;
@property (strong, nonatomic) Item *item;
@property (strong, nonatomic) NSMutableArray *addRecordArray;

@end
