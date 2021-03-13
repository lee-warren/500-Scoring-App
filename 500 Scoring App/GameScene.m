//
//  GameScene.m
//  AvoidTheSquares - iOS
//
//  Created by Lee Warren on 3/12/2014.
//  Copyright (c) 2014 Lee Warren. All rights reserved.
//


// https://color.adobe.com/create/color-wheel/?base=2&rule=Analogous&selected=0&name=My%20Color%20Theme&mode=rgb&rgbvalues=0.42914542626647834,0.5156218157642996,1,0.3188059330804909,0.91,0.6227047792433287,1,0.9843764727108347,0.40033619019834166,0.91,0.6638673052339695,0.47984958166383423,0.9986825173891246,0.39067316266713736,1&swatchOrder=0,1,2,3,4


#import "GameScene.h"
#import "MainGameScreen.h"
#import <AVFoundation/AVFoundation.h>
@import AVFoundation;

@interface GameScene ()
@property BOOL contentCreated;
@end

@implementation GameScene


- (void)didMoveToView:(SKView *)view {
    
    if (!self.contentCreated) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"showAd" object:nil];
        //[[NSNotificationCenter defaultCenter] postNotificationName:@"hideAd" object:nil];
        //Sends message to viewcontroller to hide ad.
        
        defaults = [NSUserDefaults standardUserDefaults];
        
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents {
    
    /* Setup your scene here */
    
    self.backgroundColor = [SKColor colorWithRed:89/255.0f green:89/255.0f blue:89/255.0f alpha:1.0f];

    self.scaleMode = SKSceneScaleModeFill;
    
    // for the grey shadey thingy - when stuff is pressed
    //[self addChild:[self touchingDownDarkerThingy]];
    
    amountOfPlayers = (int)[defaults integerForKey:@"AmountOfPlayers"];
    
    [self addMenuItems];
    
}

- (void) addMenuItems {
    
    [self addChild:[self play3PlayerButton]];
    [self addChild:[self play4PlayerButton]];
    [self addChild:[self play5PlayerButton]];
    [self addChild:[self play6PlayerButton]];
    
    [self addChild:[self howManyPlayersQuestion]];
    
}

// for the grey shadey thingy - when stuff is pressed
/*
- (SKSpriteNode *)touchingDownDarkerThingy {
    
    touchingDownDarkerThingy = [SKSpriteNode spriteNodeWithColor:[SKColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.3f] size:CGSizeMake(100, 100)];
    touchingDownDarkerThingy.size = CGSizeMake(self.frame.size.width/200*60, self.frame.size.width/200*60);
    touchingDownDarkerThingy.position = CGPointMake(self.frame.size.width*2, 0);
    
    return touchingDownDarkerThingy;
}
*/

- (SKSpriteNode *)play3PlayerButton {
    
    play3PlayerButton = [SKSpriteNode spriteNodeWithImageNamed:@"3Player"];
    
    play3PlayerButton.size = CGSizeMake(self.frame.size.width/200*45, self.frame.size.width/200*45);
    play3PlayerButton.position = CGPointMake(play3PlayerButton.size.width/2 + self.frame.size.width/200*4, self.frame.size.height/5*2);
    
    theNumber3 = [SKLabelNode labelNodeWithFontNamed:@"DINAlternate-Bold"];
    theNumber3.fontColor = [SKColor colorWithRed:165/255.0f green:165/255.0f blue:165/255.0f alpha:1.0f];
    theNumber3.text = @"3";
    theNumber3.fontSize = 40;
    theNumber3.position = CGPointMake(0, - play3PlayerButton.frame.size.height/2 - theNumber3.frame.size.height*1.5);
    
    [play3PlayerButton addChild:theNumber3];
    
    return play3PlayerButton;
}

- (SKSpriteNode *)play4PlayerButton {
    
    play4PlayerButton = [SKSpriteNode spriteNodeWithImageNamed:@"4Player"];
    
    play4PlayerButton.size = CGSizeMake(self.frame.size.width/200*45, self.frame.size.width/200*45);
    play4PlayerButton.position = CGPointMake(play3PlayerButton.position.x + play4PlayerButton.size.width + self.frame.size.width/200*4, play3PlayerButton.position.y);
    
    theNumber4 = [SKLabelNode labelNodeWithFontNamed:@"DINAlternate-Bold"];
    theNumber4.fontColor = [SKColor colorWithRed:165/255.0f green:165/255.0f blue:165/255.0f alpha:1.0f];
    theNumber4.text = @"4";
    theNumber4.fontSize = 40;
    theNumber4.position = CGPointMake(0, - play4PlayerButton.frame.size.height/2 - theNumber4.frame.size.height*1.5);
    
    [play4PlayerButton addChild:theNumber4];
    
    return play4PlayerButton;
}

- (SKSpriteNode *)play5PlayerButton {
    
    play5PlayerButton = [SKSpriteNode spriteNodeWithImageNamed:@"5Player"];
    
    play5PlayerButton.size = CGSizeMake(self.frame.size.width/200*45, self.frame.size.width/200*45);
    play5PlayerButton.position = CGPointMake(play4PlayerButton.position.x + play5PlayerButton.size.width + self.frame.size.width/200*4, play3PlayerButton.position.y);
    
    theNumber5 = [SKLabelNode labelNodeWithFontNamed:@"DINAlternate-Bold"];
    theNumber5.fontColor = [SKColor colorWithRed:165/255.0f green:165/255.0f blue:165/255.0f alpha:1.0f];
    theNumber5.text = @"5";
    theNumber5.fontSize = 40;
    theNumber5.position = CGPointMake(0, - play5PlayerButton.frame.size.height/2 - theNumber5.frame.size.height*1.5);
    
    [play5PlayerButton addChild:theNumber5];
    
    return play5PlayerButton;
}

- (SKSpriteNode *)play6PlayerButton {
    
    play6PlayerButton = [SKSpriteNode spriteNodeWithImageNamed:@"6Player"];
    
    play6PlayerButton.size = CGSizeMake(self.frame.size.width/200*45, self.frame.size.width/200*45);
    play6PlayerButton.position = CGPointMake(play5PlayerButton.position.x + play6PlayerButton.size.width + self.frame.size.width/200*4, play3PlayerButton.position.y);
    
    theNumber6 = [SKLabelNode labelNodeWithFontNamed:@"DINAlternate-Bold"];
    theNumber6.fontColor = [SKColor colorWithRed:165/255.0f green:165/255.0f blue:165/255.0f alpha:1.0f];
    theNumber6.text = @"6";
    theNumber6.fontSize = 40;
    theNumber6.position = CGPointMake(0, - play6PlayerButton.frame.size.height/2 - theNumber6.frame.size.height*1.5);
    
    [play6PlayerButton addChild:theNumber6];
    
    return play6PlayerButton;
}

- (SKLabelNode *)howManyPlayersQuestion {
    
    howManyPlayersQuestion = [SKLabelNode labelNodeWithFontNamed:@"DINAlternate-Bold"];
    howManyPlayersQuestion.fontColor = [SKColor colorWithRed:165/255.0f green:165/255.0f blue:165/255.0f alpha:1.0f];
    howManyPlayersQuestion.text = @"How Many Players?";
    howManyPlayersQuestion.fontSize = 35;
    howManyPlayersQuestion.position = CGPointMake(self.frame.size.width/2 ,play3PlayerButton.position.y + play3PlayerButton.frame.size.height/2 + howManyPlayersQuestion.frame.size.height);

    
    return howManyPlayersQuestion;
    
}

// for the grey shadey thingy - when stuff is pressed
/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        
        CGPoint locationOfFingerAtThatMoment = [touch locationInNode:self];
        
    }
    
}
 */


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if ((location.x > play3PlayerButton.position.x - play3PlayerButton.frame.size.width/2 -self.frame.size.width/200) && (location.x < play3PlayerButton.position.x +play3PlayerButton.frame.size.width/2 + self.frame.size.width/200) && ( location.y > play3PlayerButton.position.y -play3PlayerButton.frame.size.height/2 -self.frame.size.width/200) && (location.y < play3PlayerButton.position.y + play3PlayerButton.frame.size.height/2 +self.frame.size.width/200)) { //clicked on 3 player button
            
            [defaults setInteger:3 forKey:@"AmountOfPlayers"];
            [defaults synchronize];
            
            SKScene *mainGameScreen  = [[MainGameScreen alloc] initWithSize:self.size];
            SKTransition *appear = [SKTransition fadeWithDuration:0.2];
            [self.view presentScene:mainGameScreen transition:appear];
            
            
        } else if ((location.x > play4PlayerButton.position.x - play4PlayerButton.frame.size.width/2 -self.frame.size.width/200) && (location.x < play4PlayerButton.position.x +play4PlayerButton.frame.size.width/2 + self.frame.size.width/200) && ( location.y > play4PlayerButton.position.y -play4PlayerButton.frame.size.height/2 -self.frame.size.width/200) && (location.y < play4PlayerButton.position.y + play4PlayerButton.frame.size.height/2 +self.frame.size.width/200)) { //clicked on 4 player button
            
            [defaults setInteger:4 forKey:@"AmountOfPlayers"];
            [defaults synchronize];
            
            SKScene *mainGameScreen  = [[MainGameScreen alloc] initWithSize:self.size];
            SKTransition *appear = [SKTransition fadeWithDuration:0.2];
            [self.view presentScene:mainGameScreen transition:appear];
            
            
        } else if ((location.x > play5PlayerButton.position.x - play5PlayerButton.size.width/2 -self.frame.size.width/200) && (location.x < play5PlayerButton.position.x +play5PlayerButton.size.width/2 + self.frame.size.width/200) && ( location.y > play5PlayerButton.position.y -play5PlayerButton.size.height/2 -self.frame.size.width/200) && (location.y < play5PlayerButton.position.y + play5PlayerButton.size.height/2 +self.frame.size.width/200)) { //clicked on 5 player button
            
            [defaults setInteger:5 forKey:@"AmountOfPlayers"];
            [defaults synchronize];
            
            SKScene *mainGameScreen  = [[MainGameScreen alloc] initWithSize:self.size];
            SKTransition *appear = [SKTransition fadeWithDuration:0.2];
            [self.view presentScene:mainGameScreen transition:appear];
            
        } else if ((location.x > play6PlayerButton.position.x - play6PlayerButton.size.width/2 -self.frame.size.width/200) && (location.x < play6PlayerButton.position.x +play6PlayerButton.size.width/2 + self.frame.size.width/200) && ( location.y > play6PlayerButton.position.y -play6PlayerButton.size.height/2 -self.frame.size.width/200) && (location.y < play6PlayerButton.position.y + play6PlayerButton.size.height/2 +self.frame.size.width/200)) { //clicked on 6 player button
            
            [defaults setInteger:6 forKey:@"AmountOfPlayers"];
            [defaults synchronize];
            
            SKScene *mainGameScreen  = [[MainGameScreen alloc] initWithSize:self.size];
            SKTransition *appear = [SKTransition fadeWithDuration:0.2];
            [self.view presentScene:mainGameScreen transition:appear];
            
        }
    }
    
}

@end
