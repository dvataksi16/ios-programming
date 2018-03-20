//
//  SecondViewController.m
//  HW_3
//
//  Created by Denisa Vataksi on 2/28/18.
//  Copyright © 2018 nyu.edu. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>



@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *turnCount;

@property AVAudioPlayer *audioPlayer;

@end

int guesses = 0;
//int highScore;
@implementation SecondViewController{
    SystemSoundID winSoundID;
}
NSInteger const lowScore = @"lowScore";

- (void) viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:animated];
    
    
 
    
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    guesses ++;
    self.turnCount.text = [NSString stringWithFormat: @"%d number of guesses",guesses];
    
    if([delegate.chosenCard isEqualToString:delegate.correctCard]){
        self.label.text = [NSString stringWithFormat:@"Correct! You picked: %@", delegate.chosenCard];
        NSString *path = [NSString stringWithFormat:@"%@/win.wav", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [self.audioPlayer play];
         [self performSelector:@selector(exitProgram)  withObject:nil afterDelay:3];
    }
    else{
        self.label.text = [NSString stringWithFormat:@"Incorrect! You picked: %@. Try again.", delegate.chosenCard];
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) exitProgram {
    exit(0);
}

@end
