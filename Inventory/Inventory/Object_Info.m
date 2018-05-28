//
//  Object_Info.m
//  Inventory
//
//  Created by Denisa Vataksi on 2/11/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "Object_Info.h"

@implementation Object_Info

-(id) init: (NSString *) Description Retail_Cost:(float)Retail_Cost Wholesale_Cost:(float)Wholesale_Cost{
    if(self = [super init]){
        _Description = Description;
        _Retail_Cost = Retail_Cost;
        _Wholesale_Cost = Wholesale_Cost;
        _Num_on_Hand = 0;
        _Num_Sold = 0; //assumes it starts off with 0
    }
    
    return self;
}

//SETTERS
- (void) setDescription: (NSString *) Description{
    _Description = Description;
}
- (void) setRetailCost: (float) Retail_Cost{
    _Retail_Cost = Retail_Cost;
}
- (void) setWholesaleCost: (float) Wholesale_Cost{
    _Wholesale_Cost = Wholesale_Cost;
}
- (void) setNumOnHand{
    _Num_on_Hand = 0;
}
- (void) setNumSold: (int) Num_Sold{
    _Num_Sold = Num_Sold;
}

//GETTERS
-(NSString *) getDescription{
    return _Description;
}
-(float) getRetailCost{
    return _Retail_Cost;
}
-(float) getWholesaleCost{
    return _Wholesale_Cost;
}
-(int) getNumOnHand{
    return _Num_on_Hand;
}
-(int) getNumSold{
    return _Num_Sold;
}

-(void) Print_Object{
    NSLog(@"Description: %@, Retail Cost: %f, Wholesale Cost: %f, Num on Hand: %d, Num Sold: %d", _Description, _Retail_Cost, _Wholesale_Cost, _Num_on_Hand, _Num_Sold);
}
-(void) addUnits:(int) newStock{
    _Num_on_Hand += newStock;
}
-(void) sellUnit{
    _Num_on_Hand--;
    _Num_Sold++;
}

@end

