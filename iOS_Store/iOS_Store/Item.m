//
//  Item.m
//  iOS_Store
//
//  Created by Denisa Vataksi on 2/24/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "Item.h"
#import <UIKit/UIImage.h>
#import <UIKit/UIImageView.h>

@implementation Item


NSString *description;
float cost;
int numOnHand;


//GETTERS
-(NSString *) getName {
    
    return name;
    
}

-(NSString *) getDescription {
    
    return description;
    
}

-(float) getCost {
    
    return cost;
    
}

-(int) getNumOnHand {
    
    return numOnHand;
    
}

-(NSString *) getImagePath {
    
    return imagePath;
    
}

-(UIImageView *) getImageView {
    
    return imageView;
    
}

-(UIImage *) getImage {
    
    return productImage;
    
}


//SETTERS
-(void) setName: (NSString *) newName {
    
    name = newName;
    
}

-(void) setDescription: (NSString *) newDescription {
    
    description = newDescription;
    
}

-(void) setCost: (float) newCost {
    
    cost = newCost;
    
}

-(void) setNumOnHand:(int) newNumOnHand {
    
    numOnHand = newNumOnHand;
    
}
-(void) setImagePath: (NSString *)newImagePath {
    
    imagePath = newImagePath;
}

-(void) setImageView: (NSString *)imagePath {
    
    imageView = [[UIImageView alloc] init];
    
    
}


-(void) printObject{
    NSLog(@"%@\t | %f\t | %d", description, cost, numOnHand);
}

@end
