//
//  FirstViewController.h
//  HW_3
//
//  Created by Denisa Vataksi on 2/28/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
-(NSString *) getSuit: (int) index;
@end
