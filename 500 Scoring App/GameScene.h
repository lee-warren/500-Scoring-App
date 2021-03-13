//
//  GameScene.h
//  AvoidTheSquares - iOS
//

//  Copyright (c) 2014 Lee Warren. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameScene : SKScene {
    
    //saving player names and stuff
    NSUserDefaults *defaults;
    
    //this is made and resized depending on what you have pressed to show the player what they have clicked on
    //SKSpriteNode *touchingDownDarkerThingy;
    
    int amountOfPlayers;
    
    SKLabelNode *howManyPlayersQuestion;
    
    SKSpriteNode *play3PlayerButton;
        SKLabelNode *theNumber3;
    SKSpriteNode *play4PlayerButton;
        SKLabelNode *theNumber4;
    SKSpriteNode *play5PlayerButton;
        SKLabelNode *theNumber5;
    SKSpriteNode *play6PlayerButton;
        SKLabelNode *theNumber6;


    
}

@end
