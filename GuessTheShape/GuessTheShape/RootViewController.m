//
//  RootViewController.m
//  CG
//  
//  Created by Dylan Foglesong on 6/30/13.
//  Copyright 2013 Dylan Foglesong. All rights reserved.
//

#import "RootViewController.h"


@implementation RootViewController

@synthesize shapes_collection, randomIndex, guessThisImage, answerField, resultLabel;

- (void) generateRandomImage {
    NSUInteger tmpRandomIndex = arc4random() % [shapes_collection count];
    
    while (tmpRandomIndex == randomIndex) {
        tmpRandomIndex = arc4random() % [shapes_collection count];
        NSLog(@"same, generate again!");
    }
    
    randomIndex = tmpRandomIndex;
    
    for (id key in [shapes_collection objectAtIndex:randomIndex] ) {
        guessThisImage.image = [[shapes_collection objectAtIndex:randomIndex] valueForKey:key];
    }
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    for (id key in [shapes_collection objectAtIndex:randomIndex] ) {
        
        if ([answerField.text isEqualToString:key]) {
            answerField.text = nil;
            resultLabel.text = @"Correct!";
            [self generateRandomImage];
        } else {
            resultLabel.text = @"Wrong!";
        }
    }
    [textField resignFirstResponder];
    return YES;
}

- (void) loadView {
    [super loadView];
    NSMutableDictionary* shapes_collection = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                       @"Austrailia.png", @"Austrailia", @"China.png", @"China", @"Egypt.png", @"Egypt", @"France.png", @"France", @"India.png", @"India", @"Indonesia.png", @"Indonesia", @"Iraq.png", @"Iraq", @"Italy.png", @"Italy", @"Japan.png", @"Japan", @"Mexico.png", @"Mexico", @"Norway.png", @"Norway", @"United Kingdom.png", @"United Kingdom", @"United States.png", @"United States", nil];
    
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextButton.frame = CGRectMake(0, 300, 180, 30);
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(generateRandomImage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextButton];
    
    resultLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 230, 180, 30)];
    resultLabel.text = @" ";
    [self.view addSubview:resultLabel];
    
    answerField = [[UITextField alloc] initWithFrame:CGRectMake(0, 200, 180, 30)];
    answerField.borderStyle = UITextBorderStyleRoundedRect;
    answerField.returnKeyType = UIReturnKeyDone;
    answerField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    answerField.delegate = self;
    [self.view addSubview: answerField];
    
    //select a random image!!
    NSArray* countryNames = [shapes_collection allKeys];
    randomIndex = arc4random() % [countryNames count];
    guessThisImage = [[UIImageView alloc]initWithImage: [shapes_collection objectForKey:[countryNames objectAtIndex:randomIndex]]];
    
    [self.view addSubview:guessThisImage];
    
}

- (void) dealloc {
    
    [super dealloc];
}
@end
