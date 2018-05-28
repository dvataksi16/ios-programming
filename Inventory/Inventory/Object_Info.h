//
//  Object_Info.h
//  Inventory
//
//  Created by Denisa Vataksi on 2/11/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Object_Info : NSObject{
    NSString* _Description;
    float _Retail_Cost;
    float _Wholesale_Cost;
    int _Num_on_Hand;
    int _Num_Sold;
}
-(id) init: (NSString *) Description Retail_Cost: (float) Retail_Cost Wholesale_Cost: (float) Wholesale_Cost;

//SETTERS
- (void) setDescription: (NSString *) Description;
- (void) setRetailCost: (float) Retail_Cost;
- (void) setWholesaleCost: (float) Wholesale_Cost;
- (void) setNumOnHand;
- (void) setNumSold: (int) Num_Sold;


//GETTERS
-(NSString *) getDescription;
-(float) getRetailCost;
-(float) getWholesaleCost;
-(int) getNumOnHand;
-(int) getNumSold;

-(void) Print_Object;

//adds new incoming units to the Num_on_Hand
-(void) addUnits:(int) newStock;

//removes one unit (decrements Num_on_Hand by one and increments Num_Sold by one) --item sold
-(void) sellUnit;

@end
