//
//  Item.h
//  iOS_Store
//
//  Created by Denisa Vataksi on 2/24/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UITextView.h>

@interface Item : NSObject{

    NSString *name;
    NSString *description;
    float cost;
    int numOnHand; //stock
    NSString *imagePath;
    UIImageView *imageView;
    UIImage *productImage;
}


@property (strong, nonatomic) NSString *recordAddedName;
@property (strong, nonatomic) NSString *recordAddedDescription;
@property (strong, nonatomic) NSString *recordAddedCost;
@property (strong, nonatomic) NSString *recordAddedNumOnHand;


-(NSString *) getName;
-(NSString *) getDescription;
-(float) getCost;
-(int) getNumOnHand;
-(NSString *) getImagePath;
-(UIImageView *) getImageView;
-(UIImage *) getImage;


-(void) setName: (NSString *) newName;
-(void) setDescription: (NSString *) newDescription;
-(void) setCost: (float) newCost;
-(void) setNumOnHand: (int) newNumOnHand;
-(void) setImagePath: (NSString *) newImagePath;
-(void) setImageView: (NSString *) imagePath;
-(void) printObject;

@end
