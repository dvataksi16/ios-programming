//
//  main.m
//  Inventory
//
//  Created by Denisa Vataksi on 2/8/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Object_Info.h"



NSMutableDictionary *stock;

//adds an entry to the dict and makes an object of item
Boolean Add_Item(NSString *name, NSString *Description, float Retail_Cost, float Wholesale_Cost){
   
    if(stock == nil){
        stock = [[NSMutableDictionary alloc] init];
    }
    if([[stock allKeys] containsObject: name]){
        NSLog(@"Unable to add: Already exists in stock");
        return false;
    }
    
    
    Object_Info * obj = [[Object_Info alloc] init:Description Retail_Cost: Retail_Cost Wholesale_Cost: Wholesale_Cost];
    
    stock[name] = obj;
    
    return true;
}

//adds to the inventory of an item
Boolean Add_Stock(NSString *name, int New_Stock){
    
    if(![[stock allKeys] containsObject: name] || stock == nil){
        NSLog(@"Item %@ not found",name);
        return false;
    }
    [[stock objectForKey:name] addUnits: New_Stock];
    
    
    return true;
}

//sells requested items at a time
Boolean Sell_Item (NSString *name, int units){
    if(![[stock allKeys] containsObject: name] || stock == nil){
        NSLog(@"Item %@ not found",name);
        return false;
    }
    
    if([[stock objectForKey:name] getNumOnHand] == 0){
        NSLog(@"Item %@ is sold out", name);
        return false;
    }
    if([[stock objectForKey:name] getNumOnHand] < units){
        NSLog(@"Exceeds item's inventory. Item %@ has %d items at hand", name, [[stock objectForKey:name] getNumOnHand]);
        return false;
    }
    
    [[stock objectForKey: name] sellUnit];
    
    NSLog(@"Item %@ sold! ", name);
    [[stock objectForKey: name] Print_Object];
    
    return true;
}
//outputs current profit
void Profit_if_Store(){
    if(stock == nil){
        NSLog(@"Stock is empty!");
    }
    else{
        int profit = 0;
        for(id key in stock){
            id item = [stock objectForKey:key];
            profit += [item getNumSold] * ([item getRetailCost] - [item getWholesaleCost]);
        }
        NSLog(@"The store's profit is %d", profit);
    }
}
//outputs stock
void Print_Dictionary(){
    if(stock == nil){
        NSLog(@"Stock is empty!");
    }
    else{
        for(id key in stock){
            NSLog(@"Item %@ ", key);
            [[stock objectForKey:key] Print_Object];
        }
    }
}
//deletes entry from dict
Boolean Remove_Item(NSString *name){
    if(![[stock allKeys] containsObject: name] || stock == nil){
        NSLog(@"Item %@ not found",name);
        return false;
    }
    NSLog(@"Removing item %@ from stock", name);
    [stock removeObjectForKey:name];
    
    return true;
}


//testing
int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        Add_Item(@"iPhone 8", @"Apple's iPhone 8", 769, 450);
        Add_Item(@"Galaxy Note7", @"Samsung's Exploding Phone", 850, 550);
        Add_Item(@"40-inch TV", @"Sony's LED TV", 298, 250);
        Add_Item(@"Kindle Reader", @"Amazon's E-Reader", 79.99, 75);
        Add_Item(@"Apple Watch", @"Series 2 - Aluminum Case", 299, 200);
        
        //tests duplicate error checker in Add_Item
        Add_Item(@"iPhone 8", @"don't add", 333, 321);
        
        Add_Stock(@"iPhone 8", 2002);
        Add_Stock(@"40-inch TV", 119);
        Add_Stock(@"Kindle Reader", 205);
        Add_Stock(@"Apple Watch", 200);
        
        //checks Add_Stock error check
        Add_Stock(@"iPhone 4", 24235354);
        
        Print_Dictionary();
        
        
        Sell_Item(@"iPhone 8", 2000);
        Sell_Item(@"40-inch TV", 30);
        Sell_Item(@"Kindle Reader", 1);
         Sell_Item(@"Kindle Reader", 4);
        Sell_Item(@"Apple Watch", 200);
        
        //check error checks in sell item function
        Sell_Item(@"Galaxy Note7",1);
        Sell_Item(@"Kindle Reader", 400);
        
         Print_Dictionary();
        
    }
    
    
    return 0;
}









