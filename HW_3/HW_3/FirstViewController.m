//
//  FirstViewController.m
//  HW_3
//
//  Created by Denisa Vataksi on 2/28/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"


@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (strong, nonatomic) NSArray *cards;
@property (strong, nonatomic) NSArray *suits;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@end


NSString *cardNumberChosen = @"The Ace of";
NSString *suitChosen = @"clubs";
NSString *randomCard;
NSString *randomSuit;
NSString* cardChosen;
NSString* correctCard;
AppDelegate *delegate;
int firstLoad = 0;

@implementation FirstViewController



- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    [self.pickerView reloadAllComponents];
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource= self;
    
     self.image.image = [UIImage imageNamed: @"alien"];
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    self.suits = @[[UIImage imageNamed:@"club"],
                    [UIImage imageNamed:@"diamond"],
                    [UIImage imageNamed:@"spade"],
                    [UIImage imageNamed:@"heart"]];
    
    
    self.cards = @[@"The Ace of",@"The Two of", @"The Three of", @"The Four of", @"The Five of", @"The Six of", @"The Seven of", @"The Eight of", @"The Nine of", @"The Ten of",
                   @"The Jack of", @"The Queen of",@"The King of"];
    
    //ensuring the same random number is stored
    if(firstLoad == 0){
        [self getRandom];
        firstLoad++;
    }
}

-(void) getRandom{
    randomCard = self.cards[arc4random_uniform(2) % (int)[self.cards count]];
    randomSuit =[self getSuit: arc4random_uniform(3)  % (int)[self.suits count]];
    
    correctCard = [NSString stringWithFormat: @"%@ %@",
                   randomCard, randomSuit];
    
    srandom((int)time(NULL));
    
    delegate.correctCard = correctCard;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return [self.cards count];
    }else {
        return [self.suits count];
    }
}

#pragma mark Picker Delegate Methods
- (UIView *)pickerView:(UIPickerView *)pickerView
             viewForRow:(NSInteger)row
            forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (component == 0) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 120)];
        label.text = self.cards[row];
        label.backgroundColor = [UIColor clearColor];
        return label;
    } else {
        UIImage *image = self.suits[row];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        imageView.frame = CGRectMake(0, 0, 30, 30);
        return imageView;
        
    }
}
- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
     delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if(component == 0){
        cardNumberChosen = _cards[row];
    }
    else{
        suitChosen = [self getSuit: (int)row];
    }
    delegate.chosenCard = [NSString stringWithFormat:@"%@ %@", cardNumberChosen, suitChosen];
}

-(NSString *) getSuit: (int) index{
    NSString *suit = @"";
    switch(index){
        case 0: suit = @"clubs"; break;
        case 1: suit = @"diamonds"; break;
        case 2: suit = @"spades"; break;
        case 3: suit = @"hearts"; break;
    }
    return suit;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
