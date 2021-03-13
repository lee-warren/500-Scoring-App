//
//  MainGameScreen.m
//  500 Scoring App
//
//  Created by Lee Warren on 31/01/2015.
//  Copyright (c) 2015 Lee Warren. All rights reserved.
//

#import "MainGameScreen.h"
#import "GameScene.h"

@interface MainGameScreen ()
@property BOOL contentCreated;
@end

@implementation MainGameScreen


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
    p1Score = 0;
    p2Score = 0;
    p3Score = 0;
    p4Score = 0;
    p5Score = 0;
    p6Score = 0;
    
    greyColour = [SKColor colorWithRed:165/255.0f green:165/255.0f blue:165/255.0f alpha:1.0f];
    darkGreyColour = [SKColor colorWithRed:89/255.0f green:89/255.0f blue:89/255.0f alpha:1.0f];
    
    redColour = [SKColor colorWithRed:255/255.0f green:10/255.0f blue:0/255.0f alpha:1.0f];
    darkRedColour = [SKColor colorWithRed:191/255.0f green:7/255.0f blue:0/255.0f alpha:1.0f];
    darkDarkRedColour = [SKColor colorWithRed:64/255.0f green:2/255.0f blue:0/255.0f alpha:1.0f];
    
    blueColour = [SKColor colorWithRed:0/255.0f green:158/255.0f blue:255/255.0f alpha:1.0f];
    darkBlueColour = [SKColor colorWithRed:0/255.0f green:119/255.0f blue:191/255.0f alpha:1.0f];
    darkDarkBlueColour = [SKColor colorWithRed:0/255.0f green:40/255.0f blue:64/255.0f alpha:1.0f];

    greenColour = [SKColor colorWithRed:12/255.0f green:245/255.0f blue:67/255.0f alpha:1.0f];
    darkGreenColour = [SKColor colorWithRed:8/255.0f green:168/255.0f blue:46/255.0f alpha:1.0f];
    darkDarkGreenColour = [SKColor colorWithRed:5/255.0f green:105/255.0f blue:29/255.0f alpha:1.0f];

    yellowColour = [SKColor colorWithRed:255/255.0f green:243/255.0f blue:0/255.0f alpha:1.0f];
    darkYellowColour = [SKColor colorWithRed:191/255.0f green:183/255.0f blue:0/255.0f alpha:1.0f];
    darkDarkYellowColour = [SKColor colorWithRed:64/255.0f green:61/255.0f blue:0/255.0f alpha:1.0f];

    purpleColour = [SKColor colorWithRed:126/255.0f green:12/255.0f blue:245/255.0f alpha:1.0f];
    darkPurpleColour = [SKColor colorWithRed:86/255.0f green:8/255.0f blue:168/255.0f alpha:1.0f];
    darkDarkPurpleColour = [SKColor colorWithRed:40/255.0f green:4/255.0f blue:75/255.0f alpha:1.0f];

    orangeColour = [SKColor colorWithRed:232/255.0f green:125/255.0f blue:12/255.0f alpha:1.0f];
    darkOrangeColour = [SKColor colorWithRed:168/255.0f green:91/255.0f blue:8/255.0f alpha:1.0f];
    darkDarkOrangeColour = [SKColor colorWithRed:105/255.0f green:56/255.0f blue:5/255.0f alpha:1.0f];
    
    mainFont = @"DINAlternate-Bold";
    
    speedOfMovingStuff = 0.5;
    
    [self addChild:[self menuBar]];
    
    [self addDropDownMenus];
    
    [self addPointsMenuStuff];
    
    [self addPlayerButtons];
    
}

- (SKSpriteNode *)menuBar {
    
    menuBar = [SKSpriteNode spriteNodeWithColor: darkGreyColour size: CGSizeMake(self.frame.size.width, 40)];
    
    menuBar.position = CGPointMake(self.size.width/2,self.frame.size.height - menuBar.size.height/2);
    menuBar.zPosition = 2;
    
    returnToMenuButton = [SKSpriteNode spriteNodeWithImageNamed:@"BackArrow"];
    returnToMenuButton.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    returnToMenuButton.position = CGPointMake(-menuBar.size.width/2 + returnToMenuButton.size.width ,0);
    returnToMenuButton.color = greyColour;
    returnToMenuButton.colorBlendFactor = 1;
    
    [menuBar addChild:returnToMenuButton];
    
    menuDropdownButton = [SKSpriteNode spriteNodeWithImageNamed:@"SettingsButton"];
    menuDropdownButton.size = returnToMenuButton.size;
    menuDropdownButton.position = CGPointMake(0,0);
    menuDropdownButton.color = greyColour;
    menuDropdownButton.colorBlendFactor = 1;
    
    [menuBar addChild:menuDropdownButton];
    
    acceptButton = [SKSpriteNode spriteNodeWithImageNamed:@"Tick"];
    acceptButton.size = returnToMenuButton.size;
    acceptButton.position = CGPointMake(+menuBar.size.width/2 - acceptButton.size.width ,0);
    acceptButton.color = menuBar.color;
    acceptButton.colorBlendFactor = 1;
    
    [menuBar addChild:acceptButton];
    
    return menuBar;
}

- (void) addDropDownMenus {
    
    [self addChild:[self dropDownMenu]];
    [self addChild:[self dropDownReturnToMenuQuestion]];
    
    
}

- (void) addPointsMenuStuff {
    
    [self addChild:[self greyFadedBackground]];
    [self addChild:[self addScoreMenu]];
    
}

- (void) addPlayerButtons {
    
    [self addChild:[self player1Button]];
    [self addChild:[self player2Button]];
    [self addChild:[self player3Button]];
    
    if (amountOfPlayers >= 4) {
        [self addChild:[self player4Button]];

    }
    
    if (amountOfPlayers >= 5) {
        [self addChild:[self player5Button]];
        
    }
    
    if (amountOfPlayers >= 6) {
        [self addChild:[self player6Button]];
        
    }
    
    
}

- (SKSpriteNode *)dropDownMenu {
    
    dropDownMenu = [SKSpriteNode spriteNodeWithColor: [SKColor darkGrayColor] size:CGSizeMake(300, 250)];
    dropDownMenu.position = CGPointMake(self.size.width/2, self.size.height + dropDownMenu.size.height);
    dropDownMenu.zPosition = 1;

    customScoringButton = [SKSpriteNode spriteNodeWithImageNamed:@"CustomScoreButton"];
    customScoringButton.size = CGSizeMake(250, 41);
    customScoringButton.position = CGPointMake(0, - dropDownMenu.frame.size.height/2 + customScoringButton.frame.size.height*4);
    customScoringButton.color = greyColour;
    customScoringButton.colorBlendFactor = 1;
    
    [dropDownMenu addChild:customScoringButton];
    
    return dropDownMenu;

}

- (SKSpriteNode *)dropDownReturnToMenuQuestion {
    
    dropDownReturnToMenuQuestion = [SKSpriteNode spriteNodeWithColor: [SKColor darkGrayColor] size:CGSizeMake(300, 250)];
    dropDownReturnToMenuQuestion.position = CGPointMake(self.size.width/2, self.size.height + dropDownReturnToMenuQuestion.size.height);
    dropDownReturnToMenuQuestion.zPosition = 1;

    sureYouWantToGoToMenuLine1 = [SKLabelNode labelNodeWithFontNamed:mainFont];
    sureYouWantToGoToMenuLine1.text = @"Are you sure you want to";
    sureYouWantToGoToMenuLine1.fontSize = 25;
    sureYouWantToGoToMenuLine1.fontColor = greyColour;
    sureYouWantToGoToMenuLine1.position = CGPointMake(0,dropDownReturnToMenuQuestion.size.height/2 - sureYouWantToGoToMenuLine1.frame.size.height*3);
    [dropDownReturnToMenuQuestion addChild:sureYouWantToGoToMenuLine1];
    
    sureYouWantToGoToMenuLine2 = [SKLabelNode labelNodeWithFontNamed:mainFont];
    sureYouWantToGoToMenuLine2.text = @"return to the menu?";
    sureYouWantToGoToMenuLine2.fontSize = sureYouWantToGoToMenuLine1.fontSize;
    sureYouWantToGoToMenuLine2.fontColor = sureYouWantToGoToMenuLine1.fontColor;
    sureYouWantToGoToMenuLine2.position = CGPointMake(0,sureYouWantToGoToMenuLine1.position.y - sureYouWantToGoToMenuLine2.frame.size.height*1.5);
    [dropDownReturnToMenuQuestion addChild:sureYouWantToGoToMenuLine2];
    
    noDontReturnToMenu = [SKSpriteNode spriteNodeWithImageNamed:@"No"];
    noDontReturnToMenu.size = CGSizeMake(100, 41);
    noDontReturnToMenu.position = CGPointMake(-dropDownReturnToMenuQuestion.size.width/2 + 25 + noDontReturnToMenu.size.width/2, - dropDownReturnToMenuQuestion.frame.size.height/2 + noDontReturnToMenu.frame.size.height*2);
    noDontReturnToMenu.color = greyColour;
    noDontReturnToMenu.colorBlendFactor = 1;
    
    [dropDownReturnToMenuQuestion addChild:noDontReturnToMenu];
    
    
    yesReturnToMenu = [SKSpriteNode spriteNodeWithImageNamed:@"Yes"];
    yesReturnToMenu.size = CGSizeMake(100, 41);
    yesReturnToMenu.position = CGPointMake(dropDownReturnToMenuQuestion.size.width/2 - 25 - noDontReturnToMenu.size.width/2, noDontReturnToMenu.position.y);
    yesReturnToMenu.color = greyColour;
    yesReturnToMenu.colorBlendFactor = 1;
    
    [dropDownReturnToMenuQuestion addChild:yesReturnToMenu];
    
    
    return dropDownReturnToMenuQuestion;
    
}

- (SKSpriteNode *)greyFadedBackground {
    
    greyFadedBackground = [SKSpriteNode spriteNodeWithColor: [SKColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.5f] size:CGSizeMake(self.size.width, self.size.height)];
    greyFadedBackground.position = CGPointMake(self.size.width*2, self.size.height/2);
    greyFadedBackground.zPosition = 3;
    
    return greyFadedBackground;
    
}

- (SKSpriteNode *)addScoreMenu {
    
    addScoreMenu = [SKSpriteNode spriteNodeWithColor: [SKColor blackColor] size:CGSizeMake(300, 460)];
    addScoreMenu.position = CGPointMake(self.size.width/2, self.size.height/2*3);
    addScoreMenu.zPosition = 4;
    
    title = [SKLabelNode labelNodeWithFontNamed:mainFont];
    title.text = @"Player #";
    title.fontSize = 50;
    title.position = CGPointMake(0, addScoreMenu.frame.size.height/2 - title.frame.size.height);
    [addScoreMenu addChild:title];

    [addScoreMenu addChild:[self bettingBar]];
    
    [addScoreMenu addChild:[self suitBar]];
    
    if (amountOfPlayers == 3) {
        //not needing to do anything if there is only three players (you dont have anyone on your team)
    } else {
        whosOnYourTeam = [SKLabelNode labelNodeWithFontNamed:mainFont];
        whosOnYourTeam.text = @"Which player is on your team?";
        whosOnYourTeam.fontSize = 15;
        whosOnYourTeam.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whosOnYourTeam.frame.size.width/2 +10,suitBar.position.y - suitBar.frame.size.height);
        [addScoreMenu addChild:whosOnYourTeam];
        
        [addScoreMenu addChild:[self whosOnYourTeamBar]];
    }
    
    if (amountOfPlayers == 3) {
        //tricks need to be higher on the screen if only three players because the whosOnYourTeam bar isn't there
        whoWonTheTricks = [SKLabelNode labelNodeWithFontNamed:mainFont];
        whoWonTheTricks.text = @"Who won the tricks?";
        whoWonTheTricks.fontSize = 15;
        whoWonTheTricks.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whoWonTheTricks.frame.size.width/2 +10,suitBar.position.y - suitBar.frame.size.height);
        [addScoreMenu addChild:whoWonTheTricks];
        
    } else {
        whoWonTheTricks = [SKLabelNode labelNodeWithFontNamed:mainFont];
        whoWonTheTricks.text = @"Who won the tricks?";
        whoWonTheTricks.fontSize = 15;
        whoWonTheTricks.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whoWonTheTricks.frame.size.width/2 +10,whosOnYourTeamBar.position.y - whosOnYourTeamBar.frame.size.height);
        [addScoreMenu addChild:whoWonTheTricks];
        
    }
    
    [addScoreMenu addChild:[self tricksBar1To5]];

    [addScoreMenu addChild:[self tricksBar6To10]];
    
    if (amountOfPlayers == 5) {
        //can't have miseres in five player!
    } else {
        misereButton = [SKSpriteNode spriteNodeWithImageNamed:@"Miseres"];
        misereButton.size = CGSizeMake(160, 41);
        misereButton.position = CGPointMake(0,tricksBar6To10.position.y - title.frame.size.height);
        misereButton.color = redColour;
        misereButton.colorBlendFactor = 1;
        [addScoreMenu addChild:misereButton];
    }

    
    //these buttons are not shown until the misere button is presssed
    closedMisere = [SKSpriteNode spriteNodeWithImageNamed:@"ClosedMisere"];
    closedMisere.size = CGSizeMake(160, 41);
    closedMisere.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    closedMisere.color = redColour;
    closedMisere.colorBlendFactor = 1;
    [addScoreMenu addChild:closedMisere];
    
    openMisere = [SKSpriteNode spriteNodeWithImageNamed:@"OpenMisere"];
    openMisere.size = CGSizeMake(160, 41);
    openMisere.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    openMisere.color = redColour;
    openMisere.colorBlendFactor = 1;
    [addScoreMenu addChild:openMisere];
    
    blindMisere = [SKSpriteNode spriteNodeWithImageNamed:@"BlindMisere"];
    blindMisere.size = CGSizeMake(160, 41);
    blindMisere.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    blindMisere.color = redColour;
    blindMisere.colorBlendFactor = 1;
    [addScoreMenu addChild:blindMisere];
    ////

    cancelButton = [SKSpriteNode spriteNodeWithImageNamed:@"Cancel"];
    cancelButton.size = CGSizeMake(100, 41);
    cancelButton.position = CGPointMake(-addScoreMenu.size.width/2 + 25 + cancelButton.size.width/2, - addScoreMenu.frame.size.height/2 + cancelButton.frame.size.height);
    cancelButton.color = redColour;
    cancelButton.colorBlendFactor = 1;
    [addScoreMenu addChild:cancelButton];
    
    submitButton = [SKSpriteNode spriteNodeWithImageNamed:@"Submit"];
    submitButton.size = cancelButton.size;
    submitButton.position = CGPointMake(addScoreMenu.size.width/2 - 25 - cancelButton.size.width/2, cancelButton.position.y);
    submitButton.color = redColour;
    submitButton.colorBlendFactor = 1;
    [addScoreMenu addChild:submitButton];

    
    return addScoreMenu;
    
}

- (SKSpriteNode *)bettingBar {
    
    bettingBar = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(280, 41)];
    bettingBar.position = CGPointMake(0,title.position.y - title.frame.size.height);
    
    //Bet6
    betting6 = [SKSpriteNode spriteNodeWithImageNamed:@"Bet6"];
    betting6.size = CGSizeMake(bettingBar.size.width/5, bettingBar.size.height);
    betting6.position = CGPointMake(-bettingBar.size.width/2 + betting6.size.width/2,0);
    betting6.color = redColour;
    betting6.colorBlendFactor = 1;

    [bettingBar addChild:betting6];
    
    //Bet7
    betting7 = [SKSpriteNode spriteNodeWithImageNamed:@"Bet7"];
    betting7.size = CGSizeMake(bettingBar.size.width/5, bettingBar.size.height);
    betting7.position = CGPointMake(-bettingBar.size.width/2 + betting6.size.width/2*3,0);
    betting7.color = redColour;
    betting7.colorBlendFactor = 1;
    
    [bettingBar addChild:betting7];
    
    //Bet8
    betting8 = [SKSpriteNode spriteNodeWithImageNamed:@"Bet8"];
    betting8.size = CGSizeMake(bettingBar.size.width/5, bettingBar.size.height);
    betting8.position = CGPointMake(-bettingBar.size.width/2 + betting6.size.width/2*5,0);
    betting8.color = redColour;
    betting8.colorBlendFactor = 1;
    
    [bettingBar addChild:betting8];
    
    //Bet9
    betting9 = [SKSpriteNode spriteNodeWithImageNamed:@"Bet9"];
    betting9.size = CGSizeMake(bettingBar.size.width/5, bettingBar.size.height);
    betting9.position = CGPointMake(-bettingBar.size.width/2 + betting6.size.width/2*7,0);
    betting9.color = redColour;
    betting9.colorBlendFactor = 1;
    
    [bettingBar addChild:betting9];
    
    //Bet10
    betting10 = [SKSpriteNode spriteNodeWithImageNamed:@"Bet10"];
    betting10.size = CGSizeMake(bettingBar.size.width/5, bettingBar.size.height);
    betting10.position = CGPointMake(-bettingBar.size.width/2 + betting6.size.width/2*9,0);
    betting10.color = redColour;
    betting10.colorBlendFactor = 1;
    
    [bettingBar addChild:betting10];
    
    return bettingBar;
}

- (SKSpriteNode *)suitBar {
    
    suitBar = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(280, 41)];
    suitBar.position = CGPointMake(0,bettingBar.position.y - title.frame.size.height);
    
    //spades
    suit1 = [SKSpriteNode spriteNodeWithImageNamed:@"Spades"];
    suit1.size = CGSizeMake(suitBar.size.width/5, suitBar.size.height);
    suit1.position = CGPointMake(-suitBar.size.width/2 + suit1.size.width/2,0);
    suit1.color = redColour;
    suit1.colorBlendFactor = 1;
    
    [suitBar addChild:suit1];
    
    //clubs
    suit2 = [SKSpriteNode spriteNodeWithImageNamed:@"Clubs"];
    suit2.size = CGSizeMake(suitBar.size.width/5, suitBar.size.height);
    suit2.position = CGPointMake(-suitBar.size.width/2 + suit1.size.width/2*3,0);
    suit2.color = redColour;
    suit2.colorBlendFactor = 1;
    
    [suitBar addChild:suit2];
    
    //diamonds
    suit3 = [SKSpriteNode spriteNodeWithImageNamed:@"Diamonds"];
    suit3.size = CGSizeMake(suitBar.size.width/5, suitBar.size.height);
    suit3.position = CGPointMake(-suitBar.size.width/2 + suit1.size.width/2*5,0);
    suit3.color = redColour;
    suit3.colorBlendFactor = 1;
    
    [suitBar addChild:suit3];
    
    //hearts
    suit4 = [SKSpriteNode spriteNodeWithImageNamed:@"Hearts"];
    suit4.size = CGSizeMake(suitBar.size.width/5, suitBar.size.height);
    suit4.position = CGPointMake(-suitBar.size.width/2 + suit1.size.width/2*7,0);
    suit4.color = redColour;
    suit4.colorBlendFactor = 1;
    
    [suitBar addChild:suit4];
    
    //noes
    suit5 = [SKSpriteNode spriteNodeWithImageNamed:@"Noes"];
    suit5.size = CGSizeMake(suitBar.size.width/5, suitBar.size.height);
    suit5.position = CGPointMake(-suitBar.size.width/2 + suit1.size.width/2*9,0);
    suit5.color = redColour;
    suit5.colorBlendFactor = 1;
    
    [suitBar addChild:suit5];
    
    return suitBar;
}

- (SKSpriteNode *)whosOnYourTeamBar {
    
    whosOnYourTeamBar = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake((amountOfPlayers - 1)*56, 41)];
    whosOnYourTeamBar.position = CGPointMake(0,whosOnYourTeam.position.y - whosOnYourTeam.frame.size.height/2*3);
    
    //
    teamMate1 = [SKSpriteNode spriteNodeWithImageNamed:@"Player1"];
    teamMate1.size = CGSizeMake(whosOnYourTeamBar.size.width/3, whosOnYourTeamBar.size.height);
    teamMate1.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2,0);
    teamMate1.color = redColour;
    teamMate1.colorBlendFactor = 1;
    
    [whosOnYourTeamBar addChild:teamMate1];
    
    //
    teamMate2 = [SKSpriteNode spriteNodeWithImageNamed:@"Player2"];
    teamMate2.size = CGSizeMake(whosOnYourTeamBar.size.width/3, whosOnYourTeamBar.size.height);
    teamMate2.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*3,0);
    teamMate2.color = redColour;
    teamMate2.colorBlendFactor = 1;
    
    [whosOnYourTeamBar addChild:teamMate2];
    
    //
    teamMate3 = [SKSpriteNode spriteNodeWithImageNamed:@"Player3"];
    teamMate3.size = CGSizeMake(whosOnYourTeamBar.size.width/3, whosOnYourTeamBar.size.height);
    teamMate3.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*5,0);
    teamMate3.color = redColour;
    teamMate3.colorBlendFactor = 1;
    
    [whosOnYourTeamBar addChild:teamMate3];
    
    if (amountOfPlayers >= 5) {
        teamMate1.size = CGSizeMake(whosOnYourTeamBar.size.width/4, whosOnYourTeamBar.size.height);
        teamMate1.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2,0);
        teamMate2.size = CGSizeMake(whosOnYourTeamBar.size.width/4, whosOnYourTeamBar.size.height);
        teamMate2.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*3,0);
        teamMate3.size = CGSizeMake(whosOnYourTeamBar.size.width/4, whosOnYourTeamBar.size.height);
        teamMate3.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*5,0);

        teamMate4 = [SKSpriteNode spriteNodeWithImageNamed:@"Player4"];
        teamMate4.size = CGSizeMake(whosOnYourTeamBar.size.width/4, whosOnYourTeamBar.size.height);
        teamMate4.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*7,0);
        teamMate4.color = redColour;
        teamMate4.colorBlendFactor = 1;
        
        [whosOnYourTeamBar addChild:teamMate4];
    }
    
    if (amountOfPlayers >= 6) {
        teamMate1.size = CGSizeMake(whosOnYourTeamBar.size.width/5, whosOnYourTeamBar.size.height);
        teamMate1.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2,0);
        teamMate2.size = CGSizeMake(whosOnYourTeamBar.size.width/5, whosOnYourTeamBar.size.height);
        teamMate2.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*3,0);
        teamMate3.size = CGSizeMake(whosOnYourTeamBar.size.width/5, whosOnYourTeamBar.size.height);
        teamMate3.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*5,0);
        teamMate4.size = CGSizeMake(whosOnYourTeamBar.size.width/5, whosOnYourTeamBar.size.height);
        teamMate4.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*7,0);

        teamMate5 = [SKSpriteNode spriteNodeWithImageNamed:@"Player5"];
        teamMate5.size = CGSizeMake(whosOnYourTeamBar.size.width/5, whosOnYourTeamBar.size.height);
        teamMate5.position = CGPointMake(-whosOnYourTeamBar.size.width/2 + teamMate1.size.width/2*9,0);
        teamMate5.color = redColour;
        teamMate5.colorBlendFactor = 1;
        
        [whosOnYourTeamBar addChild:teamMate5];
    }
    
    return whosOnYourTeamBar;
}

- (SKSpriteNode *)tricksBar1To5 {
    
    tricksBar1To5 = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(5*56, 41)];
    tricksBar1To5.position = CGPointMake(0,whoWonTheTricks.position.y - 17/2*3);
    
    //
    trick1 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick1"];
    trick1.size = CGSizeMake(tricksBar1To5.size.width/5, tricksBar1To5.size.height);
    trick1.position = CGPointMake(-tricksBar1To5.size.width/2 + trick1.size.width/2,0);
    trick1.color = redColour;
    trick1.colorBlendFactor = 1;
    trick1.name  = @"EmptyTrick";
    
    [tricksBar1To5 addChild:trick1];
    
    //
    trick2 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick2"];
    trick2.size = CGSizeMake(tricksBar1To5.size.width/5, tricksBar1To5.size.height);
    trick2.position = CGPointMake(-tricksBar1To5.size.width/2 + trick1.size.width/2*3,0);
    trick2.color = redColour;
    trick2.colorBlendFactor = 1;
    trick2.name  = @"EmptyTrick";
    
    [tricksBar1To5 addChild:trick2];
    
    //
    trick3 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick3"];
    trick3.size = CGSizeMake(tricksBar1To5.size.width/5, tricksBar1To5.size.height);
    trick3.position = CGPointMake(-tricksBar1To5.size.width/2 + trick1.size.width/2*5,0);
    trick3.color = redColour;
    trick3.colorBlendFactor = 1;
    trick3.name  = @"EmptyTrick";
    
    [tricksBar1To5 addChild:trick3];
    
    trick4 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick4"];
    trick4.size = CGSizeMake(tricksBar1To5.size.width/5, tricksBar1To5.size.height);
    trick4.position = CGPointMake(-tricksBar1To5.size.width/2 + trick1.size.width/2*7,0);
    trick4.color = redColour;
    trick4.colorBlendFactor = 1;
    trick4.name  = @"EmptyTrick";
    
    [tricksBar1To5 addChild:trick4];
    
    trick5 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick5"];
    trick5.size = CGSizeMake(tricksBar1To5.size.width/5, tricksBar1To5.size.height);
    trick5.position = CGPointMake(-tricksBar1To5.size.width/2 + trick1.size.width/2*9,0);
    trick5.color = redColour;
    trick5.colorBlendFactor = 1;
    trick5.name  = @"EmptyTrick";
    
    [tricksBar1To5 addChild:trick5];
    
    
    return tricksBar1To5;
}

- (SKSpriteNode *)tricksBar6To10 {
    
    tricksBar6To10 = [SKSpriteNode spriteNodeWithColor:[SKColor clearColor] size:CGSizeMake(5*56, 41)];
    tricksBar6To10.position = CGPointMake(0,tricksBar1To5.position.y - tricksBar1To5.size.height);

    //
    trick6 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick6"];
    trick6.size = CGSizeMake(tricksBar6To10.size.width/5, tricksBar6To10.size.height);
    trick6.position = CGPointMake(-tricksBar6To10.size.width/2 + trick6.size.width/2,0);
    trick6.color = redColour;
    trick6.colorBlendFactor = 1;
    trick6.name  = @"EmptyTrick";
    
    [tricksBar6To10 addChild:trick6];
    
    //
    trick7 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick7"];
    trick7.size = CGSizeMake(tricksBar6To10.size.width/5, tricksBar6To10.size.height);
    trick7.position = CGPointMake(-tricksBar6To10.size.width/2 + trick6.size.width/2*3,0);
    trick7.color = redColour;
    trick7.colorBlendFactor = 1;
    trick7.name  = @"EmptyTrick";
    
    [tricksBar6To10 addChild:trick7];
    
    //
    trick8 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick8"];
    trick8.size = CGSizeMake(tricksBar6To10.size.width/5, tricksBar6To10.size.height);
    trick8.position = CGPointMake(-tricksBar6To10.size.width/2 + trick6.size.width/2*5,0);
    trick8.color = redColour;
    trick8.colorBlendFactor = 1;
    trick8.name  = @"EmptyTrick";
    
    [tricksBar6To10 addChild:trick8];
    
    trick9 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick9"];
    trick9.size = CGSizeMake(tricksBar6To10.size.width/5, tricksBar6To10.size.height);
    trick9.position = CGPointMake(-tricksBar6To10.size.width/2 + trick6.size.width/2*7,0);
    trick9.color = redColour;
    trick9.colorBlendFactor = 1;
    trick9.name  = @"EmptyTrick";
    
    [tricksBar6To10 addChild:trick9];
    
    trick10 = [SKSpriteNode spriteNodeWithImageNamed:@"Trick10"];
    trick10.size = CGSizeMake(tricksBar6To10.size.width/5, tricksBar6To10.size.height);
    trick10.position = CGPointMake(-tricksBar6To10.size.width/2 + trick6.size.width/2*9,0);
    trick10.color = redColour;
    trick10.colorBlendFactor = 1;
    trick10.name  = @"EmptyTrick";
    
    [tricksBar6To10 addChild:trick10];
    
    
    return tricksBar6To10;
}




- (SKSpriteNode *)player1Button {
    
    player1Button = [SKSpriteNode spriteNodeWithColor: redColour size:CGSizeMake(self.size.width, 100)];
    
    if (amountOfPlayers == 3) {
        player1Button.size = CGSizeMake(self.size.width, (self.size.height - menuBar.frame.size.height)/3);
    } else if (amountOfPlayers == 4) {
        player1Button.size = CGSizeMake(self.size.width, (self.size.height - menuBar.frame.size.height)/4);
    } else if (amountOfPlayers == 5) {
        player1Button.size = CGSizeMake(self.size.width, (self.size.height - menuBar.frame.size.height)/5);
    } else if (amountOfPlayers == 6) {
        player1Button.size = CGSizeMake(self.size.width, (self.size.height - menuBar.frame.size.height)/6);
    }
    
    player1Button.position = CGPointMake(self.size.width/2,self.size.height - menuBar.frame.size.height - player1Button.size.height/2);

    SKLabelNode *player1ButtonText = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player1ButtonText.fontColor = darkRedColour;
    player1ButtonText.text = @"Player 1";
    player1ButtonText.fontSize = 45;
    player1ButtonText.position = CGPointMake(-self.size.width/4, - player1ButtonText.frame.size.height/4);
    
    [player1Button addChild:player1ButtonText];
    
    player1sScore = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player1sScore.fontColor = darkRedColour;
    player1sScore.text = [NSString stringWithFormat:@"%d",p1Score];
    player1sScore.fontSize = 45;
    player1sScore.position = CGPointMake(+self.size.width/4, - player1ButtonText.frame.size.height/4);
    
    [player1Button addChild:player1sScore];
    
    //these arent show until custom scores are to be put in
    
    addButton1 = [SKSpriteNode spriteNodeWithImageNamed:@"PlusButton"];
    addButton1.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    addButton1.position = CGPointMake(player1sScore.position.x + addButton1.frame.size.width*2 ,player1sScore.position.y + player1sScore.frame.size.height/2);
    addButton1.color = player1Button.color; //darkRedColour
    addButton1.colorBlendFactor = 1;
    
    [player1Button addChild:addButton1];
    
    minusButton1 = [SKSpriteNode spriteNodeWithImageNamed:@"MinusButton"];
    minusButton1.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    minusButton1.position = CGPointMake(player1sScore.position.x - minusButton1.frame.size.width*2 ,player1sScore.position.y + player1sScore.frame.size.height/2);
    minusButton1.color = player1Button.color; //darkRedColour
    minusButton1.colorBlendFactor = 1;
    
    [player1Button addChild:minusButton1];
    
    //
    
    return player1Button;
}

- (SKSpriteNode *)player2Button {
    
    player2Button = [SKSpriteNode spriteNodeWithColor: blueColour size: player1Button.size];
    
    player2Button.position = CGPointMake(self.size.width/2,player1Button.position.y - player1Button.size.height);
    
    SKLabelNode *player2ButtonText = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player2ButtonText.fontColor = darkBlueColour;
    player2ButtonText.text = @"Player 2";
    player2ButtonText.fontSize = 45;
    player2ButtonText.position = CGPointMake(-self.size.width/4, - player2ButtonText.frame.size.height/4);
    
    [player2Button addChild:player2ButtonText];
    
    player2sScore = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player2sScore.fontColor = darkBlueColour;
    player2sScore.text = [NSString stringWithFormat:@"%d",p2Score];
    player2sScore.fontSize = 45;
    player2sScore.position = CGPointMake(+self.size.width/4, - player2ButtonText.frame.size.height/4);
    
    [player2Button addChild:player2sScore];
    
    //these arent show until custom scores are to be put in
    
    addButton2 = [SKSpriteNode spriteNodeWithImageNamed:@"PlusButton"];
    addButton2.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    addButton2.position = CGPointMake(addButton1.position.x ,player2sScore.position.y + player2sScore.frame.size.height/2);
    addButton2.color = player2Button.color; //darkBlueColour
    addButton2.colorBlendFactor = 1;
    
    [player2Button addChild:addButton2];
    
    minusButton2 = [SKSpriteNode spriteNodeWithImageNamed:@"MinusButton"];
    minusButton2.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    minusButton2.position = CGPointMake(minusButton1.position.x  ,player2sScore.position.y + player2sScore.frame.size.height/2);
    minusButton2.color = player2Button.color; //darkBlueColour
    minusButton2.colorBlendFactor = 1;
    
    [player2Button addChild:minusButton2];
    
    //
    
    return player2Button;
}

- (SKSpriteNode *)player3Button {
    
    player3Button = [SKSpriteNode spriteNodeWithColor: greenColour size:player1Button.size];
    
    player3Button.position = CGPointMake(self.size.width/2, player2Button.position.y - player1Button.size.height);
    
    SKLabelNode *player3ButtonText = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player3ButtonText.fontColor = darkGreenColour;
    player3ButtonText.text = @"Player 3";
    player3ButtonText.fontSize = 45;
    player3ButtonText.position = CGPointMake(-self.size.width/4, - player3ButtonText.frame.size.height/4);
    
    [player3Button addChild:player3ButtonText];
    
    player3sScore = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player3sScore.fontColor = darkGreenColour;
    player3sScore.text = [NSString stringWithFormat:@"%d",p3Score];
    player3sScore.fontSize = 45;
    player3sScore.position = CGPointMake(+self.size.width/4, - player3ButtonText.frame.size.height/4);
    
    [player3Button addChild:player3sScore];
    
    //these arent show until custom scores are to be put in
    
    addButton3 = [SKSpriteNode spriteNodeWithImageNamed:@"PlusButton"];
    addButton3.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    addButton3.position = CGPointMake(addButton1.position.x ,player3sScore.position.y + player3sScore.frame.size.height/2);
    addButton3.color = player3Button.color; // darkGreenColour
    addButton3.colorBlendFactor = 1;
    
    [player3Button addChild:addButton3];
    
    minusButton3 = [SKSpriteNode spriteNodeWithImageNamed:@"MinusButton"];
    minusButton3.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    minusButton3.position = CGPointMake(minusButton1.position.x ,player3sScore.position.y + player3sScore.frame.size.height/2);
    minusButton3.color = player3Button.color; //darkGreenColour
    minusButton3.colorBlendFactor = 1;
    
    [player3Button addChild:minusButton3];
    
    //
    
    return player3Button;
}

- (SKSpriteNode *)player4Button {
    
    player4Button = [SKSpriteNode spriteNodeWithColor: yellowColour size:player1Button.size];
    
    player4Button.position = CGPointMake(self.size.width/2, player3Button.position.y - player1Button.size.height);
    
    SKLabelNode *player4ButtonText = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player4ButtonText.fontColor = darkYellowColour;
    player4ButtonText.text = @"Player 4";
    player4ButtonText.fontSize = 45;
    player4ButtonText.position = CGPointMake(-self.size.width/4, - player4ButtonText.frame.size.height/4);
    
    [player4Button addChild:player4ButtonText];
    
    player4sScore = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player4sScore.fontColor = darkYellowColour;
    player4sScore.text = [NSString stringWithFormat:@"%d",p4Score];
    player4sScore.fontSize = 45;
    player4sScore.position = CGPointMake(+self.size.width/4, - player4ButtonText.frame.size.height/4);
    
    [player4Button addChild:player4sScore];
    
    //these arent show until custom scores are to be put in
    
    addButton4 = [SKSpriteNode spriteNodeWithImageNamed:@"PlusButton"];
    addButton4.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    addButton4.position = CGPointMake(addButton1.position.x ,player4sScore.position.y + player4sScore.frame.size.height/2);
    addButton4.color = player4Button.color; //darkYellowColour
    addButton4.colorBlendFactor = 1;
    
    [player4Button addChild:addButton4];
    
    minusButton4 = [SKSpriteNode spriteNodeWithImageNamed:@"MinusButton"];
    minusButton4.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    minusButton4.position = CGPointMake(minusButton1.position.x ,player4sScore.position.y + player4sScore.frame.size.height/2);
    minusButton4.color = player4Button.color; //darkYellowColour
    minusButton4.colorBlendFactor = 1;
    
    [player4Button addChild:minusButton4];
    
    //
    
    return player4Button;
}

- (SKSpriteNode *)player5Button {
    
    player5Button = [SKSpriteNode spriteNodeWithColor: purpleColour size:player1Button.size];
    
    player5Button.position = CGPointMake(self.size.width/2, player4Button.position.y - player1Button.size.height);
    
    SKLabelNode *player5ButtonText = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player5ButtonText.fontColor = darkPurpleColour;
    player5ButtonText.text = @"Player 5";
    player5ButtonText.fontSize = 45;
    player5ButtonText.position = CGPointMake(-self.size.width/4, - player5ButtonText.frame.size.height/4);
    
    [player5Button addChild:player5ButtonText];
    
    player5sScore = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player5sScore.fontColor = darkPurpleColour;
    player5sScore.text = [NSString stringWithFormat:@"%d",p5Score];
    player5sScore.fontSize = 45;
    player5sScore.position = CGPointMake(+self.size.width/4, - player5ButtonText.frame.size.height/4);
    
    [player5Button addChild:player5sScore];
    
    //these arent show until custom scores are to be put in
    
    addButton5 = [SKSpriteNode spriteNodeWithImageNamed:@"PlusButton"];
    addButton5.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    addButton5.position = CGPointMake(addButton1.position.x ,player5sScore.position.y + player5sScore.frame.size.height/2);
    addButton5.color = player5Button.color; //darkPurpleColour
    addButton5.colorBlendFactor = 1;
    
    [player5Button addChild:addButton5];
    
    minusButton5 = [SKSpriteNode spriteNodeWithImageNamed:@"MinusButton"];
    minusButton5.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    minusButton5.position = CGPointMake(minusButton1.position.x ,player5sScore.position.y + player5sScore.frame.size.height/2);
    minusButton5.color = player5Button.color; //darkPurpleColour
    minusButton5.colorBlendFactor = 1;
    
    [player5Button addChild:minusButton5];
    
    //
    
    return player5Button;
}

- (SKSpriteNode *)player6Button {
    
    player6Button = [SKSpriteNode spriteNodeWithColor: orangeColour size:player1Button.size];
    
    player6Button.position = CGPointMake(self.size.width/2, player5Button.position.y - player1Button.size.height);
    
    SKLabelNode *player6ButtonText = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player6ButtonText.fontColor = darkOrangeColour;
    player6ButtonText.text = @"Player 6";
    player6ButtonText.fontSize = 45;
    player6ButtonText.position = CGPointMake(-self.size.width/4, - player6ButtonText.frame.size.height/4);
    
    [player6Button addChild:player6ButtonText];
    
    player6sScore = [SKLabelNode labelNodeWithFontNamed:mainFont];
    player6sScore.fontColor = darkOrangeColour;
    player6sScore.text = [NSString stringWithFormat:@"%d",p6Score];
    player6sScore.fontSize = 45;
    player6sScore.position = CGPointMake(+self.size.width/4, - player6ButtonText.frame.size.height/4);
    
    [player6Button addChild:player6sScore];
    
    //these arent show until custom scores are to be put in
    
    addButton6 = [SKSpriteNode spriteNodeWithImageNamed:@"PlusButton"];
    addButton6.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    addButton6.position = CGPointMake(addButton1.position.x ,player6sScore.position.y + player6sScore.frame.size.height/2);
    addButton6.color = player6Button.color; //darkOrangeColour
    addButton6.colorBlendFactor = 1;
    
    [player6Button addChild:addButton6];
    
    minusButton6 = [SKSpriteNode spriteNodeWithImageNamed:@"MinusButton"];
    minusButton6.size = CGSizeMake(menuBar.size.height - 10,menuBar.size.height - 10);
    minusButton6.position = CGPointMake(minusButton1.position.x ,player6sScore.position.y + player6sScore.frame.size.height/2);
    minusButton6.color = player6Button.color; //darkOrangeColour
    minusButton6.colorBlendFactor = 1;
    
    [player6Button addChild:minusButton6];
    
    //
    
    return player6Button;
}



- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (pauseOn == false) { //
         
            if (dropDownMenuOn == false) {
                
            if ((location.x > returnToMenuButton.position.x + returnToMenuButton.parent.position.x - returnToMenuButton.size.width/2 -self.frame.size.width/100) && (location.x < returnToMenuButton.position.x + returnToMenuButton.parent.position.x +returnToMenuButton.size.width/2 + self.frame.size.width/100) && ( location.y > returnToMenuButton.position.y + returnToMenuButton.parent.position.y -returnToMenuButton.size.height/2) && (location.y < returnToMenuButton.position.y + returnToMenuButton.parent.position.y + returnToMenuButton.size.height/2)) { //clicked on return to menu button
                
                whatKindOfPauseMenu = @"ReturnToMenu";
                [self menuDropdownIsOn];
                
                
            } else if ((location.x > menuDropdownButton.position.x + menuDropdownButton.parent.position.x - menuDropdownButton.size.width/2 -self.frame.size.width/100) && (location.x < menuDropdownButton.position.x + menuDropdownButton.parent.position.x +menuDropdownButton.size.width/2 + self.frame.size.width/100) && ( location.y > menuDropdownButton.position.y + menuDropdownButton.parent.position.y -menuDropdownButton.size.height/2) && (location.y < menuDropdownButton.position.y + menuDropdownButton.parent.position.y + menuDropdownButton.size.height/2)) { //clicked on menu Dropdown Button
                
                whatKindOfPauseMenu = @"MenuDropdown";
                [self menuDropdownIsOn];
                
                
            } else if ((location.x > player1Button.position.x - player1Button.frame.size.width/2) && (location.x < player1Button.position.x +player1Button.frame.size.width/2) && ( location.y > player1Button.position.y -player1Button.frame.size.height/2) && (location.y < player1Button.position.y + player1Button.frame.size.height/2)) { //clicked on player 1 button
                
                whoToAddPointsTo = 1;
                colour = redColour;
                darkColour = darkRedColour;
                darkDarkColour = darkDarkRedColour;
                [self pointsMenuIsOn:whoToAddPointsTo];
                
                
            } else if ((location.x > player2Button.position.x - player2Button.frame.size.width/2) && (location.x < player2Button.position.x +player2Button.frame.size.width/2) && ( location.y > player2Button.position.y -player2Button.frame.size.height/2) && (location.y < player2Button.position.y + player2Button.frame.size.height/2)) { //clicked on player 2 button
                
                whoToAddPointsTo = 2;
                colour = blueColour;
                darkColour =darkBlueColour;
                darkDarkColour = darkDarkBlueColour;
                [self pointsMenuIsOn:whoToAddPointsTo];
                
            } else if ((location.x > player3Button.position.x - player3Button.frame.size.width/2) && (location.x < player3Button.position.x +player3Button.frame.size.width/2) && ( location.y > player3Button.position.y -player3Button.frame.size.height/2) && (location.y < player3Button.position.y + player3Button.frame.size.height/2)) { //clicked on player 3 button
                
                whoToAddPointsTo = 3;
                colour = greenColour;
                darkColour = darkGreenColour;
                darkDarkColour = darkDarkGreenColour;
                [self pointsMenuIsOn:whoToAddPointsTo];
                
            } else if ((location.x > player4Button.position.x - player4Button.frame.size.width/2) && (location.x < player4Button.position.x +player4Button.frame.size.width/2) && ( location.y > player4Button.position.y -player4Button.frame.size.height/2) && (location.y < player4Button.position.y + player4Button.frame.size.height/2)) { //clicked on player 4 button
                
                whoToAddPointsTo = 4;
                colour = yellowColour;
                darkColour = darkYellowColour;
                darkDarkColour = darkDarkYellowColour;
                [self pointsMenuIsOn:whoToAddPointsTo];
                
            } else if ((location.x > player5Button.position.x - player5Button.frame.size.width/2) && (location.x < player5Button.position.x +player5Button.frame.size.width/2) && ( location.y > player5Button.position.y -player5Button.frame.size.height/2) && (location.y < player5Button.position.y + player5Button.frame.size.height/2)) { //clicked on player 5 button
                
                whoToAddPointsTo = 5;
                colour = purpleColour;
                darkColour = darkPurpleColour;
                darkDarkColour = darkDarkPurpleColour;
                [self pointsMenuIsOn:whoToAddPointsTo];
                
            } else if ((location.x > player6Button.position.x - player6Button.frame.size.width/2) && (location.x < player6Button.position.x +player6Button.frame.size.width/2) && ( location.y > player6Button.position.y -player6Button.frame.size.height/2) && (location.y < player6Button.position.y + player6Button.frame.size.height/2)) { //clicked on player 6 button
                
                whoToAddPointsTo = 6;
                colour = orangeColour;
                darkColour = darkOrangeColour;
                darkDarkColour = darkDarkOrangeColour;
                [self pointsMenuIsOn:whoToAddPointsTo];
                
            }
                
            }else { //dropdown menu is on
                
                if ([whatKindOfPauseMenu isEqualToString:@"ReturnToMenu"]) { //buttons for the return to menu thing
                    
                    if ((location.x < dropDownReturnToMenuQuestion.position.x - dropDownReturnToMenuQuestion.frame.size.width/2) || (location.x > dropDownReturnToMenuQuestion.position.x +dropDownReturnToMenuQuestion.frame.size.width/2) || ( location.y < dropDownReturnToMenuQuestion.position.y -dropDownReturnToMenuQuestion.frame.size.height/2) || (location.y > dropDownReturnToMenuQuestion.position.y + dropDownReturnToMenuQuestion.frame.size.height/2)) { //clicked outside of dropDownReturnToMenuQuestion
                        
                        [self menuDropdownIsOff];
                        
                    } else if ((location.x > yesReturnToMenu.position.x + yesReturnToMenu.parent.position.x - yesReturnToMenu.size.width/2 -self.frame.size.width/100) && (location.x < yesReturnToMenu.position.x + yesReturnToMenu.parent.position.x +yesReturnToMenu.size.width/2 + self.frame.size.width/100) && ( location.y > yesReturnToMenu.position.y + yesReturnToMenu.parent.position.y -yesReturnToMenu.size.height/2 -self.frame.size.width/100) && (location.y < yesReturnToMenu.position.y + yesReturnToMenu.parent.position.y + yesReturnToMenu.size.height/2 +self.frame.size.width/100)) { //clicked on return to menu confirmation
                        
                        [self menuDropdownIsOff];
                        
                        //return to menu
                        SKScene *gameScene  = [[GameScene alloc] initWithSize:self.size];
                        SKTransition *appear = [SKTransition fadeWithDuration:0.2];
                        [self.view presentScene:gameScene transition:appear];
                        
                        
                    } else if ((location.x > noDontReturnToMenu.position.x + noDontReturnToMenu.parent.position.x - noDontReturnToMenu.size.width/2 -self.frame.size.width/100) && (location.x < noDontReturnToMenu.position.x + noDontReturnToMenu.parent.position.x +noDontReturnToMenu.size.width/2 + self.frame.size.width/100) && ( location.y > noDontReturnToMenu.position.y + noDontReturnToMenu.parent.position.y -noDontReturnToMenu.size.height/2 -self.frame.size.width/100) && (location.y < noDontReturnToMenu.position.y + noDontReturnToMenu.parent.position.y + noDontReturnToMenu.size.height/2 +self.frame.size.width/100)) { //clicked on cancel return to menu confirmation
                        
                        [self menuDropdownIsOff];
                        
                        
                    }
                    
                } else if ([whatKindOfPauseMenu isEqualToString:@"MenuDropdown"]) { //buttons for the menu dropdown
                    
                    if ((location.x < dropDownMenu.position.x - dropDownMenu.frame.size.width/2) || (location.x > dropDownMenu.position.x +dropDownMenu.frame.size.width/2) || ( location.y < dropDownMenu.position.y -dropDownMenu.frame.size.height/2) || (location.y > dropDownMenu.position.y + dropDownMenu.frame.size.height/2)) { //clicked outside of dropDownMenu
                        
                        [self menuDropdownIsOff];
                        
                    } else if ((location.x > customScoringButton.position.x + customScoringButton.parent.position.x - customScoringButton.size.width/2 -self.frame.size.width/100) && (location.x < customScoringButton.position.x + customScoringButton.parent.position.x +customScoringButton.size.width/2 + self.frame.size.width/100) && ( location.y > customScoringButton.position.y + customScoringButton.parent.position.y -customScoringButton.size.height/2 -self.frame.size.width/100) && (location.y < customScoringButton.position.y + customScoringButton.parent.position.y + noDontReturnToMenu.size.height/2 +self.frame.size.width/100)) { //clicked on custom Scoring Button
                        
                        [self menuDropdownIsOff];
                        [self customScoringIsOn];
                        
                    }
                    
                    
                } else if ([whatKindOfPauseMenu isEqualToString:@"CustomScoringButton"]) {
                    
                    if ((location.x > acceptButton.position.x + acceptButton.parent.position.x - acceptButton.size.width/2 -self.frame.size.width/100) && (location.x < acceptButton.position.x + acceptButton.parent.position.x +acceptButton.size.width/2 + self.frame.size.width/100) && ( location.y > acceptButton.position.y + acceptButton.parent.position.y -acceptButton.size.height/2) && (location.y < acceptButton.position.y + acceptButton.parent.position.y + acceptButton.size.height/2)) { //clicked on accept Button
                        
                        [self customScoringIsOff];
                        
                        
                    }
                    
                }
            }
            
            
        } else { //the pause menu
            
            if ((location.x > cancelButton.position.x + cancelButton.parent.position.x - cancelButton.size.width/2 -self.frame.size.width/100) && (location.x < cancelButton.position.x + cancelButton.parent.position.x +cancelButton.size.width/2 + self.frame.size.width/100) && ( location.y > cancelButton.position.y + cancelButton.parent.position.y -cancelButton.size.height/2 -self.frame.size.width/100) && (location.y < cancelButton.position.y + cancelButton.parent.position.y + cancelButton.size.height/2 +self.frame.size.width/100)) { //clicked on cancel button
                
                [self pointsMenuIsOff];
                
            } else if ((location.x > submitButton.position.x + submitButton.parent.position.x - submitButton.size.width/2 -self.frame.size.width/100) && (location.x < submitButton.position.x + submitButton.parent.position.x +submitButton.size.width/2 + self.frame.size.width/100) && ( location.y > submitButton.position.y + submitButton.parent.position.y -submitButton.size.height/2 -self.frame.size.width/100) && (location.y < submitButton.position.y + submitButton.parent.position.y + submitButton.size.height/2 +self.frame.size.width/100)) { //clicked on submit Button
                
                [self checkTricksHaveBeenFilled];
                if (tricksHaveBeenFilled == true) {
                    //save scores here
                    [self addAllScores];
                    [self pointsMenuIsOff];
                } else {
                    //print warning to say that all tricks must be filled in and then stay on the points menu
                }
                
            } else if ((location.x < addScoreMenu.position.x - addScoreMenu.frame.size.width/2) || (location.x > addScoreMenu.position.x +addScoreMenu.frame.size.width/2) || ( location.y < addScoreMenu.position.y -addScoreMenu.frame.size.height/2) || (location.y > addScoreMenu.position.y + addScoreMenu.frame.size.height/2)) { //clicked outside of the add score menu
                
                [self pointsMenuIsOff];
                
            } else if ((location.x > misereButton.position.x + misereButton.parent.position.x - misereButton.size.width/2 -self.frame.size.width/100) && (location.x < misereButton.position.x + misereButton.parent.position.x +misereButton.size.width/2 + self.frame.size.width/100) && ( location.y > misereButton.position.y + misereButton.parent.position.y -misereButton.size.height/2 -self.frame.size.width/100) && (location.y < misereButton.position.y + misereButton.parent.position.y + misereButton.size.height/2 +self.frame.size.width/100)) { //clicked on misere button
                
                [self misereOn];
                
            } else if ((location.x > suit1.position.x + suit1.parent.position.x + suit1.parent.parent.position.x - suit1.size.width/2 -self.frame.size.width/100) && (location.x < suit1.position.x + suit1.parent.position.x + suit1.parent.parent.position.x +suit1.size.width/2 + self.frame.size.width/100) && ( location.y > suit1.position.y + suit1.parent.position.y + suit1.parent.parent.position.y -suit1.size.height/2 -self.frame.size.width/100) && (location.y < suit1.position.y + suit1.parent.position.y + suit1.parent.parent.position.y + suit1.size.height/2 +self.frame.size.width/100)) {  //clicked on suit 1
                
                suit1.color = darkDarkColour;
                suit2.color = darkColour;
                suit3.color = darkColour;
                suit4.color = darkColour;
                suit5.color = darkColour;

            } else if ((location.x > suit2.position.x + suit2.parent.position.x + suit2.parent.parent.position.x - suit2.size.width/2 -self.frame.size.width/100) && (location.x < suit2.position.x + suit2.parent.position.x + suit2.parent.parent.position.x +suit2.size.width/2 + self.frame.size.width/100) && ( location.y > suit2.position.y + suit2.parent.position.y + suit2.parent.parent.position.y -suit2.size.height/2 -self.frame.size.width/100) && (location.y < suit2.position.y + suit2.parent.position.y + suit2.parent.parent.position.y + suit2.size.height/2 +self.frame.size.width/100)) {  //clicked on suit 2
                
                suit1.color = darkColour;
                suit2.color = darkDarkColour;
                suit3.color = darkColour;
                suit4.color = darkColour;
                suit5.color = darkColour;
                
            } else if ((location.x > suit3.position.x + suit3.parent.position.x + suit3.parent.parent.position.x - suit3.size.width/2 -self.frame.size.width/100) && (location.x < suit3.position.x + suit3.parent.position.x + suit3.parent.parent.position.x +suit3.size.width/2 + self.frame.size.width/100) && ( location.y > suit3.position.y + suit3.parent.position.y + suit3.parent.parent.position.y -suit3.size.height/2 -self.frame.size.width/100) && (location.y < suit3.position.y + suit3.parent.position.y + suit3.parent.parent.position.y + suit3.size.height/2 +self.frame.size.width/100)) {  //clicked on suit 3
                
                suit1.color = darkColour;
                suit2.color = darkColour;
                suit3.color = darkDarkColour;
                suit4.color = darkColour;
                suit5.color = darkColour;
                
            } else if ((location.x > suit4.position.x + suit4.parent.position.x + suit4.parent.parent.position.x - suit4.size.width/2 -self.frame.size.width/100) && (location.x < suit4.position.x + suit4.parent.position.x + suit4.parent.parent.position.x +suit4.size.width/2 + self.frame.size.width/100) && ( location.y > suit4.position.y + suit4.parent.position.y + suit4.parent.parent.position.y -suit4.size.height/2 -self.frame.size.width/100) && (location.y < suit4.position.y + suit4.parent.position.y + suit4.parent.parent.position.y + suit4.size.height/2 +self.frame.size.width/100)) {  //clicked on suit 4
                
                suit1.color = darkColour;
                suit2.color = darkColour;
                suit3.color = darkColour;
                suit4.color = darkDarkColour;
                suit5.color = darkColour;
                
            } else if ((location.x > suit5.position.x + suit5.parent.position.x + suit5.parent.parent.position.x - suit5.size.width/2 -self.frame.size.width/100) && (location.x < suit5.position.x + suit5.parent.position.x + suit5.parent.parent.position.x +suit5.size.width/2 + self.frame.size.width/100) && ( location.y > suit5.position.y + suit5.parent.position.y + suit5.parent.parent.position.y -suit5.size.height/2 -self.frame.size.width/100) && (location.y < suit5.position.y + suit5.parent.position.y + suit5.parent.parent.position.y + suit5.size.height/2 +self.frame.size.width/100)) {  //clicked on suit 5
                
                suit1.color = darkColour;
                suit2.color = darkColour;
                suit3.color = darkColour;
                suit4.color = darkColour;
                suit5.color = darkDarkColour;
                
            } else if ((location.x > betting6.position.x + betting6.parent.position.x + betting6.parent.parent.position.x - betting6.size.width/2 -self.frame.size.width/100) && (location.x < betting6.position.x + betting6.parent.position.x + betting6.parent.parent.position.x +betting6.size.width/2 + self.frame.size.width/100) && ( location.y > betting6.position.y + betting6.parent.position.y + betting6.parent.parent.position.y -betting6.size.height/2 -self.frame.size.width/100) && (location.y < betting6.position.y + betting6.parent.position.y + betting6.parent.parent.position.y + betting6.size.height/2 +self.frame.size.width/100)) {  //clicked on betting 6
                
                betting6.color = darkDarkColour;
                betting7.color = darkColour;
                betting8.color = darkColour;
                betting9.color = darkColour;
                betting10.color = darkColour;
                
            } else if ((location.x > betting7.position.x + betting7.parent.position.x + betting7.parent.parent.position.x - betting7.size.width/2 -self.frame.size.width/100) && (location.x < betting7.position.x + betting7.parent.position.x + betting7.parent.parent.position.x +betting7.size.width/2 + self.frame.size.width/100) && ( location.y > betting7.position.y + betting7.parent.position.y + betting7.parent.parent.position.y -betting7.size.height/2 -self.frame.size.width/100) && (location.y < betting7.position.y + betting7.parent.position.y + betting7.parent.parent.position.y + betting7.size.height/2 +self.frame.size.width/100)) {  //clicked on betting 7
                
                betting6.color = darkColour;
                betting7.color = darkDarkColour;
                betting8.color = darkColour;
                betting9.color = darkColour;
                betting10.color = darkColour;
                
            } else if ((location.x > betting8.position.x + betting8.parent.position.x + betting8.parent.parent.position.x - betting8.size.width/2 -self.frame.size.width/100) && (location.x < betting8.position.x + betting8.parent.position.x + betting8.parent.parent.position.x +betting8.size.width/2 + self.frame.size.width/100) && ( location.y > betting8.position.y + betting8.parent.position.y + betting8.parent.parent.position.y -betting8.size.height/2 -self.frame.size.width/100) && (location.y < betting8.position.y + betting8.parent.position.y + betting8.parent.parent.position.y + betting8.size.height/2 +self.frame.size.width/100)) {  //clicked on betting 8
                
                betting6.color = darkColour;
                betting7.color = darkColour;
                betting8.color = darkDarkColour;
                betting9.color = darkColour;
                betting10.color = darkColour;
                
            } else if ((location.x > betting9.position.x + betting9.parent.position.x + betting9.parent.parent.position.x - betting9.size.width/2 -self.frame.size.width/100) && (location.x < betting9.position.x + betting9.parent.position.x + betting9.parent.parent.position.x +betting9.size.width/2 + self.frame.size.width/100) && ( location.y > betting9.position.y + betting9.parent.position.y + betting9.parent.parent.position.y -betting9.size.height/2 -self.frame.size.width/100) && (location.y < betting9.position.y + betting9.parent.position.y + betting9.parent.parent.position.y + betting9.size.height/2 +self.frame.size.width/100)) {  //clicked on betting 9
                
                betting6.color = darkColour;
                betting7.color = darkColour;
                betting8.color = darkColour;
                betting9.color = darkDarkColour;
                betting10.color = darkColour;
                
            } else if ((location.x > betting10.position.x + betting10.parent.position.x + betting10.parent.parent.position.x - betting10.size.width/2 -self.frame.size.width/100) && (location.x < betting10.position.x + betting10.parent.position.x + betting10.parent.parent.position.x +betting10.size.width/2 + self.frame.size.width/100) && ( location.y > betting10.position.y + betting10.parent.position.y + betting10.parent.parent.position.y -betting10.size.height/2 -self.frame.size.width/100) && (location.y < betting10.position.y + betting10.parent.position.y + betting10.parent.parent.position.y + betting10.size.height/2 +self.frame.size.width/100)) {  //clicked on betting 10
                
                betting6.color = darkColour;
                betting7.color = darkColour;
                betting8.color = darkColour;
                betting9.color = darkColour;
                betting10.color = darkDarkColour;
                
            } else if ((location.x > teamMate1.position.x + teamMate1.parent.position.x + teamMate1.parent.parent.position.x - teamMate1.size.width/2 -self.frame.size.width/100) && (location.x < teamMate1.position.x + teamMate1.parent.position.x + teamMate1.parent.parent.position.x +teamMate1.size.width/2 + self.frame.size.width/100) && ( location.y > teamMate1.position.y + teamMate1.parent.position.y + teamMate1.parent.parent.position.y -teamMate1.size.height/2 -self.frame.size.width/100) && (location.y < teamMate1.position.y + teamMate1.parent.position.y + teamMate1.parent.parent.position.y + teamMate1.size.height/2 +self.frame.size.width/100)) {  //clicked on team mate 1
                
                teamMate1.color = darkDarkColour;
                teamMate2.color = darkColour;
                teamMate3.color = darkColour;
                teamMate4.color = darkColour;
                teamMate5.color = darkColour;
                
            } else if ((location.x > teamMate2.position.x + teamMate2.parent.position.x + teamMate2.parent.parent.position.x - teamMate2.size.width/2 -self.frame.size.width/100) && (location.x < teamMate2.position.x + teamMate2.parent.position.x + teamMate2.parent.parent.position.x +teamMate2.size.width/2 + self.frame.size.width/100) && ( location.y > teamMate2.position.y + teamMate2.parent.position.y + teamMate2.parent.parent.position.y -teamMate2.size.height/2 -self.frame.size.width/100) && (location.y < teamMate2.position.y + teamMate2.parent.position.y + teamMate2.parent.parent.position.y + teamMate2.size.height/2 +self.frame.size.width/100)) {  //clicked on team mate 2
                
                teamMate1.color = darkColour;
                teamMate2.color = darkDarkColour;
                teamMate3.color = darkColour;
                teamMate4.color = darkColour;
                teamMate5.color = darkColour;
                
            } else if ((location.x > teamMate3.position.x + teamMate3.parent.position.x + teamMate3.parent.parent.position.x - teamMate3.size.width/2 -self.frame.size.width/100) && (location.x < teamMate3.position.x + teamMate3.parent.position.x + teamMate3.parent.parent.position.x +teamMate3.size.width/2 + self.frame.size.width/100) && ( location.y > teamMate3.position.y + teamMate3.parent.position.y + teamMate3.parent.parent.position.y -teamMate3.size.height/2 -self.frame.size.width/100) && (location.y < teamMate3.position.y + teamMate3.parent.position.y + teamMate3.parent.parent.position.y + teamMate3.size.height/2 +self.frame.size.width/100)) {  //clicked on team mate 3
                
                teamMate1.color = darkColour;
                teamMate2.color = darkColour;
                teamMate3.color = darkDarkColour;
                teamMate4.color = darkColour;
                teamMate5.color = darkColour;
                
            } else if ((location.x > teamMate4.position.x + teamMate4.parent.position.x + teamMate4.parent.parent.position.x - teamMate4.size.width/2 -self.frame.size.width/100) && (location.x < teamMate4.position.x + teamMate4.parent.position.x + teamMate4.parent.parent.position.x +teamMate4.size.width/2 + self.frame.size.width/100) && ( location.y > teamMate4.position.y + teamMate4.parent.position.y + teamMate4.parent.parent.position.y -teamMate4.size.height/2 -self.frame.size.width/100) && (location.y < teamMate4.position.y + teamMate4.parent.position.y + teamMate4.parent.parent.position.y + teamMate4.size.height/2 +self.frame.size.width/100)) {  //clicked on team mate 4
                
                teamMate1.color = darkColour;
                teamMate2.color = darkColour;
                teamMate3.color = darkColour;
                teamMate4.color = darkDarkColour;
                teamMate5.color = darkColour;
                
            } else if ((location.x > teamMate5.position.x + teamMate5.parent.position.x + teamMate5.parent.parent.position.x - teamMate5.size.width/2 -self.frame.size.width/100) && (location.x < teamMate5.position.x + teamMate5.parent.position.x + teamMate5.parent.parent.position.x +teamMate5.size.width/2 + self.frame.size.width/100) && ( location.y > teamMate5.position.y + teamMate5.parent.position.y + teamMate5.parent.parent.position.y -teamMate5.size.height/2 -self.frame.size.width/100) && (location.y < teamMate5.position.y + teamMate5.parent.position.y + teamMate2.parent.parent.position.y + teamMate5.size.height/2 +self.frame.size.width/100)) {  //clicked on team mate 5
                
                teamMate1.color = darkColour;
                teamMate2.color = darkColour;
                teamMate3.color = darkColour;
                teamMate4.color = darkColour;
                teamMate5.color = darkDarkColour;
                
            } else if ((location.x > trick1.position.x + trick1.parent.position.x + trick1.parent.parent.position.x - trick1.size.width/2 -self.frame.size.width/100) && (location.x < trick1.position.x + trick1.parent.position.x + trick1.parent.parent.position.x +trick1.size.width/2 + self.frame.size.width/100) && ( location.y > trick1.position.y + trick1.parent.position.y + trick1.parent.parent.position.y -trick1.size.height/2 -self.frame.size.width/100) && (location.y < trick1.position.y + trick1.parent.position.y + trick1.parent.parent.position.y + trick1.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 1
                
                [self changingTrickPictures:trick1];
                
            } else if ((location.x > trick2.position.x + trick2.parent.position.x + trick2.parent.parent.position.x - trick2.size.width/2 -self.frame.size.width/100) && (location.x < trick2.position.x + trick2.parent.position.x + trick2.parent.parent.position.x +trick2.size.width/2 + self.frame.size.width/100) && ( location.y > trick2.position.y + trick2.parent.position.y + trick2.parent.parent.position.y -trick2.size.height/2 -self.frame.size.width/100) && (location.y < trick2.position.y + trick2.parent.position.y + trick1.parent.parent.position.y + trick2.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 2
                
                [self changingTrickPictures:trick2];
                
            } else if ((location.x > trick3.position.x + trick3.parent.position.x + trick3.parent.parent.position.x - trick3.size.width/2 -self.frame.size.width/100) && (location.x < trick3.position.x + trick3.parent.position.x + trick3.parent.parent.position.x +trick3.size.width/2 + self.frame.size.width/100) && ( location.y > trick3.position.y + trick3.parent.position.y + trick3.parent.parent.position.y -trick3.size.height/2 -self.frame.size.width/100) && (location.y < trick3.position.y + trick3.parent.position.y + trick3.parent.parent.position.y + trick3.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 3
                
                [self changingTrickPictures:trick3];
                
            } else if ((location.x > trick4.position.x + trick4.parent.position.x + trick4.parent.parent.position.x - trick4.size.width/2 -self.frame.size.width/100) && (location.x < trick4.position.x + trick4.parent.position.x + trick4.parent.parent.position.x +trick4.size.width/2 + self.frame.size.width/100) && ( location.y > trick4.position.y + trick4.parent.position.y + trick4.parent.parent.position.y -trick4.size.height/2 -self.frame.size.width/100) && (location.y < trick4.position.y + trick4.parent.position.y + trick4.parent.parent.position.y + trick4.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 4
                
                [self changingTrickPictures:trick4];
                
            } else if ((location.x > trick5.position.x + trick5.parent.position.x + trick5.parent.parent.position.x - trick5.size.width/2 -self.frame.size.width/100) && (location.x < trick5.position.x + trick5.parent.position.x + trick5.parent.parent.position.x +trick5.size.width/2 + self.frame.size.width/100) && ( location.y > trick5.position.y + trick5.parent.position.y + trick5.parent.parent.position.y -trick5.size.height/2 -self.frame.size.width/100) && (location.y < trick5.position.y + trick5.parent.position.y + trick5.parent.parent.position.y + trick5.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 5
                
                [self changingTrickPictures:trick5];
                
            } else if ((location.x > trick6.position.x + trick6.parent.position.x + trick6.parent.parent.position.x - trick6.size.width/2 -self.frame.size.width/100) && (location.x < trick6.position.x + trick6.parent.position.x + trick6.parent.parent.position.x +trick6.size.width/2 + self.frame.size.width/100) && ( location.y > trick6.position.y + trick6.parent.position.y + trick6.parent.parent.position.y -trick6.size.height/2 -self.frame.size.width/100) && (location.y < trick6.position.y + trick6.parent.position.y + trick6.parent.parent.position.y + trick6.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 6
                
                [self changingTrickPictures:trick6];
                
            } else if ((location.x > trick7.position.x + trick7.parent.position.x + trick7.parent.parent.position.x - trick7.size.width/2 -self.frame.size.width/100) && (location.x < trick7.position.x + trick7.parent.position.x + trick7.parent.parent.position.x +trick7.size.width/2 + self.frame.size.width/100) && ( location.y > trick7.position.y + trick7.parent.position.y + trick7.parent.parent.position.y -trick7.size.height/2 -self.frame.size.width/100) && (location.y < trick7.position.y + trick7.parent.position.y + trick7.parent.parent.position.y + trick7.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 7
                
                [self changingTrickPictures:trick7];
                
            } else if ((location.x > trick8.position.x + trick8.parent.position.x + trick8.parent.parent.position.x - trick8.size.width/2 -self.frame.size.width/100) && (location.x < trick8.position.x + trick8.parent.position.x + trick8.parent.parent.position.x +trick8.size.width/2 + self.frame.size.width/100) && ( location.y > trick8.position.y + trick8.parent.position.y + trick8.parent.parent.position.y -trick8.size.height/2 -self.frame.size.width/100) && (location.y < trick8.position.y + trick8.parent.position.y + trick8.parent.parent.position.y + trick8.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 8
                
                [self changingTrickPictures:trick8];
                
            } else if ((location.x > trick9.position.x + trick9.parent.position.x + trick9.parent.parent.position.x - trick9.size.width/2 -self.frame.size.width/100) && (location.x < trick9.position.x + trick9.parent.position.x + trick9.parent.parent.position.x +trick9.size.width/2 + self.frame.size.width/100) && ( location.y > trick9.position.y + trick9.parent.position.y + trick9.parent.parent.position.y -trick9.size.height/2 -self.frame.size.width/100) && (location.y < trick9.position.y + trick9.parent.position.y + trick9.parent.parent.position.y + trick9.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 9
                
                [self changingTrickPictures:trick9];
                
            } else if ((location.x > trick10.position.x + trick10.parent.position.x + trick10.parent.parent.position.x - trick10.size.width/2 -self.frame.size.width/100) && (location.x < trick10.position.x + trick10.parent.position.x + trick10.parent.parent.position.x +trick10.size.width/2 + self.frame.size.width/100) && ( location.y > trick10.position.y + trick10.parent.position.y + trick10.parent.parent.position.y -trick10.size.height/2 -self.frame.size.width/100) && (location.y < trick10.position.y + trick10.parent.position.y + trick10.parent.parent.position.y + trick10.size.height/2 +self.frame.size.width/100)) {  //clicked on trick 10
                
                [self changingTrickPictures:trick10];
                
            }  else if ((location.x > closedMisere.position.x + closedMisere.parent.position.x - closedMisere.size.width/2 -self.frame.size.width/100) && (location.x < closedMisere.position.x + closedMisere.parent.position.x +closedMisere.size.width/2 + self.frame.size.width/100) && ( location.y > closedMisere.position.y + closedMisere.parent.position.y -closedMisere.size.height/2 -self.frame.size.width/100) && (location.y < closedMisere.position.y + closedMisere.parent.position.y + closedMisere.size.height/2 +self.frame.size.width/100)) { //clicked on closed Misere
                
                closedMisere.color = darkDarkColour;
                openMisere.color = darkColour;
                blindMisere.color = darkColour;

            }  else if ((location.x > openMisere.position.x + openMisere.parent.position.x - openMisere.size.width/2 -self.frame.size.width/100) && (location.x < openMisere.position.x + openMisere.parent.position.x +openMisere.size.width/2 + self.frame.size.width/100) && ( location.y > openMisere.position.y + openMisere.parent.position.y -openMisere.size.height/2 -self.frame.size.width/100) && (location.y < openMisere.position.y + openMisere.parent.position.y + openMisere.size.height/2 +self.frame.size.width/100)) { //clicked on open Misere
                
                closedMisere.color = darkColour;
                openMisere.color = darkDarkColour;
                blindMisere.color = darkColour;
                
            }  else if ((location.x > blindMisere.position.x + blindMisere.parent.position.x - blindMisere.size.width/2 -self.frame.size.width/100) && (location.x < blindMisere.position.x + blindMisere.parent.position.x +blindMisere.size.width/2 + self.frame.size.width/100) && ( location.y > blindMisere.position.y + blindMisere.parent.position.y -blindMisere.size.height/2 -self.frame.size.width/100) && (location.y < blindMisere.position.y + blindMisere.parent.position.y + blindMisere.size.height/2 +self.frame.size.width/100)) { //clicked on blind Misere
                
                closedMisere.color = darkColour;
                openMisere.color = darkColour;
                blindMisere.color = darkDarkColour;
                
            }

        }
        
    }
}

-(void)customScoringIsOn {
    
    dropDownMenuOn = true;
    whatKindOfPauseMenu = @"CustomScoringButton";
    
    acceptButton.color = greyColour;

    addButton1.color = darkRedColour;
    minusButton1.color = darkRedColour;
    addButton2.color = darkBlueColour;
    minusButton2.color = darkBlueColour;
    addButton3.color = darkGreenColour;
    minusButton3.color = darkGreenColour;
    addButton4.color = darkYellowColour;
    minusButton4.color = darkYellowColour;
    addButton5.color = darkPurpleColour;
    minusButton5.color = darkPurpleColour;
    addButton6.color = darkOrangeColour;
    minusButton6.color = darkOrangeColour;
}

-(void)customScoringIsOff {
    
    dropDownMenuOn = false;
    
    acceptButton.color = darkGreyColour;
    
    addButton1.color = redColour;
    minusButton1.color = redColour;
    addButton2.color = blueColour;
    minusButton2.color = blueColour;
    addButton3.color = greenColour;
    minusButton3.color = greenColour;
    addButton4.color = yellowColour;
    minusButton4.color = yellowColour;
    addButton5.color = purpleColour;
    minusButton5.color = purpleColour;
    addButton6.color = orangeColour;
    minusButton6.color = orangeColour;
    
}

-(void)menuDropdownIsOn {
    
    dropDownMenuOn = true;
    
    if ([whatKindOfPauseMenu isEqualToString: @"ReturnToMenu"]) {
        
        returnToMenuButton.color = [SKColor whiteColor];
        
        [dropDownReturnToMenuQuestion runAction: [SKAction moveTo:CGPointMake(self.size.width/2, self.size.height - menuBar.size.height - dropDownReturnToMenuQuestion.size.height/2 ) duration:speedOfMovingStuff ]];
        
    } else if ([whatKindOfPauseMenu isEqualToString: @"MenuDropdown"]) {
        //dropdown for menu dropdown
        menuDropdownButton.color = [SKColor whiteColor];
        
        [dropDownMenu runAction: [SKAction moveTo:CGPointMake(self.size.width/2, self.size.height - menuBar.size.height - dropDownMenu.size.height/2 ) duration:speedOfMovingStuff ]];
    }


}

-(void)menuDropdownIsOff {
    
    [dropDownReturnToMenuQuestion runAction: [SKAction moveTo:CGPointMake(self.size.width/2, self.size.height + dropDownReturnToMenuQuestion.size.height) duration:speedOfMovingStuff ]];
    
    [dropDownMenu runAction: [SKAction moveTo:CGPointMake(self.size.width/2, self.size.height + dropDownMenu.size.height) duration:speedOfMovingStuff ]];

    returnToMenuButton.color = greyColour;
    menuDropdownButton.color = greyColour;

    dropDownMenuOn = false;
    
}

-(void)changingTrickPictures:(SKSpriteNode*)trick {
    
    if ([trick.name  isEqual: @"EmptyTrick"]){
        
        trick.color = darkDarkColour;
        trick.texture = [SKTexture textureWithImageNamed:@"Player1"];
        trick.name = @"P1";
        
    } else if ([trick.name  isEqual: @"P1"]){
        
        trick.color = darkDarkColour;
        trick.texture = [SKTexture textureWithImageNamed:@"Player2"];
        trick.name = @"P2";
        
    } else if ([trick.name  isEqual: @"P2"]){
        
        trick.color = darkDarkColour;
        trick.texture = [SKTexture textureWithImageNamed:@"Player3"];
        trick.name = @"P3";
    } else if ([trick.name  isEqual: @"P3"]){
        
        if (amountOfPlayers == 3) { //only three people are playing - 4,5,6 cant have won any tricks
            trick.color = darkDarkColour;
            trick.texture = [SKTexture textureWithImageNamed:@"Player1"];
            trick.name = @"P1";
        } else { //more than three playersers
            trick.color = darkDarkColour;
            trick.texture = [SKTexture textureWithImageNamed:@"Player4"];
            trick.name = @"P4";
        }
        
    } else if ([trick.name  isEqual: @"P4"]){
        
        if (amountOfPlayers == 4) { //only three people are playing - 4,5,6 cant have won any tricks
            trick.color = darkDarkColour;
            trick.texture = [SKTexture textureWithImageNamed:@"Player1"];
            trick.name = @"P1";
        } else { //more than four playersers
            trick.color = darkDarkColour;
            trick.texture = [SKTexture textureWithImageNamed:@"Player5"];
            trick.name = @"P5";
        }
        
    } else if ([trick.name  isEqual: @"P5"]){
        
        if (amountOfPlayers == 5) { //only three people are playing - 4,5,6 cant have won any tricks
            trick.color = darkDarkColour;
            trick.texture = [SKTexture textureWithImageNamed:@"Player1"];
            trick.name = @"P1";
        } else { //more than three playersers
            trick.color = darkDarkColour;
            trick.texture = [SKTexture textureWithImageNamed:@"Player6"];
            trick.name = @"P6";
        }
        
    } else if ([trick.name  isEqual: @"P6"]){ // go back to the start now, ran out of players
        
        trick.color = darkDarkColour;
        trick.texture = [SKTexture textureWithImageNamed:@"Player1"];
        trick.name = @"P1";
    }
    
}
                    
-(void)checkTricksHaveBeenFilled {
 
    if ([trick1.name isEqual: @"EmptyTrick"] || [trick2.name isEqual: @"EmptyTrick"] || [trick3.name isEqual: @"EmptyTrick"] || [trick4.name isEqual: @"EmptyTrick"] || [trick5.name isEqual: @"EmptyTrick"] || [trick6.name isEqual: @"EmptyTrick"] || [trick7.name isEqual: @"EmptyTrick"] || [trick8.name isEqual: @"EmptyTrick"] || [trick9.name isEqual: @"EmptyTrick"] || [trick10.name isEqual: @"EmptyTrick"] ) {
        
        tricksHaveBeenFilled = false;
        
    } else { // all tricks must have been filled
        
        tricksHaveBeenFilled = true;
        
    }
    
}
    
-(void)pointsMenuIsOn:(int)playerNumber {
    
    pauseOn = true;
    greyFadedBackground.position = CGPointMake(self.size.width/2, self.size.height/2);
    
    addScoreMenu.color = colour;
    
    title.fontColor = darkDarkColour;
    title.text = [NSString stringWithFormat:@"Player %i",playerNumber];
    
    betting6.color = darkDarkColour; // makes one darker to begin with so that if none are selected it doesn't get confused and just uses that one
    betting7.color = darkColour;
    betting8.color = darkColour;
    betting9.color = darkColour;
    betting10.color = darkColour;

    suit1.color = darkDarkColour; // makes one darker to begin with so that if none are selected it doesn't get confused and just uses that one
    suit2.color = darkColour;
    suit3.color = darkColour;
    suit4.color = darkColour;
    suit5.color = darkColour;
    
    whosOnYourTeam.fontColor = darkDarkColour;
    
    teamMate1.color = darkDarkColour;
    teamMate2.color = darkColour;
    teamMate3.color = darkColour;
    teamMate4.color = darkColour;
    teamMate5.color = darkColour;
    
    if (playerNumber == 1) {
        teamMate1.texture = [SKTexture textureWithImageNamed:@"Player2"];
        teamMate2.texture = [SKTexture textureWithImageNamed:@"Player3"];
        teamMate3.texture = [SKTexture textureWithImageNamed:@"Player4"];

        if (amountOfPlayers == 5) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
        } else if (amountOfPlayers == 6) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
            teamMate5.texture = [SKTexture textureWithImageNamed:@"Player6"];
        }
    } else if (playerNumber == 2) {
        teamMate1.texture = [SKTexture textureWithImageNamed:@"Player1"];
        teamMate2.texture = [SKTexture textureWithImageNamed:@"Player3"];
        teamMate3.texture = [SKTexture textureWithImageNamed:@"Player4"];
        
        if (amountOfPlayers == 5) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
        } else if (amountOfPlayers == 6) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
            teamMate5.texture = [SKTexture textureWithImageNamed:@"Player6"];
        }
    } else if (playerNumber == 3) {
        teamMate1.texture = [SKTexture textureWithImageNamed:@"Player1"];
        teamMate2.texture = [SKTexture textureWithImageNamed:@"Player2"];
        teamMate3.texture = [SKTexture textureWithImageNamed:@"Player4"];
        
        if (amountOfPlayers == 5) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
        } else if (amountOfPlayers == 6) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
            teamMate5.texture = [SKTexture textureWithImageNamed:@"Player6"];
        }
    } else if (playerNumber == 4) {
        teamMate1.texture = [SKTexture textureWithImageNamed:@"Player1"];
        teamMate2.texture = [SKTexture textureWithImageNamed:@"Player2"];
        teamMate3.texture = [SKTexture textureWithImageNamed:@"Player3"];
        
        if (amountOfPlayers == 5) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
        } else if (amountOfPlayers == 6) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player5"];
            teamMate5.texture = [SKTexture textureWithImageNamed:@"Player6"];
        }
    } else if (playerNumber == 5) {
        teamMate1.texture = [SKTexture textureWithImageNamed:@"Player1"];
        teamMate2.texture = [SKTexture textureWithImageNamed:@"Player2"];
        teamMate3.texture = [SKTexture textureWithImageNamed:@"Player3"];
        
        if (amountOfPlayers == 5) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player4"];
        } else if (amountOfPlayers == 6) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player4"];
            teamMate5.texture = [SKTexture textureWithImageNamed:@"Player6"];
        }
    } else if (playerNumber == 6) {
        teamMate1.texture = [SKTexture textureWithImageNamed:@"Player1"];
        teamMate2.texture = [SKTexture textureWithImageNamed:@"Player2"];
        teamMate3.texture = [SKTexture textureWithImageNamed:@"Player3"];
        
        if (amountOfPlayers == 5) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player4"];
        } else if (amountOfPlayers == 6) {
            teamMate4.texture = [SKTexture textureWithImageNamed:@"Player4"];
            teamMate5.texture = [SKTexture textureWithImageNamed:@"Player5"];
        }
    }
    
    whoWonTheTricks.fontColor = darkDarkColour;
    
    trick1.color = darkColour;
    trick2.color = darkColour;
    trick3.color = darkColour;
    trick4.color = darkColour;
    trick5.color = darkColour;
    
    trick6.color = darkColour;
    trick7.color = darkColour;
    trick8.color = darkColour;
    trick9.color = darkColour;
    trick10.color = darkColour;
    
    misereButton.color = darkDarkColour;
        closedMisere.color = darkColour;
        openMisere.color = darkColour;
        blindMisere.color = darkColour;

    cancelButton.color = darkDarkColour;
    submitButton.color = darkDarkColour;

    [addScoreMenu runAction: [SKAction moveTo:CGPointMake(self.size.width/2, self.size.height/2) duration:speedOfMovingStuff ]];

    
}

-(void)addAllScores {
    
    [self addTrickScores:trick1];
    [self addTrickScores:trick2];
    [self addTrickScores:trick3];
    [self addTrickScores:trick4];
    [self addTrickScores:trick5];
    [self addTrickScores:trick6];
    [self addTrickScores:trick7];
    [self addTrickScores:trick8];
    [self addTrickScores:trick9];
    [self addTrickScores:trick10];

    if ([teamMate1.color isEqual: darkDarkColour]) {
        if (whoToAddPointsTo > 1){
            teamMate = 1;
        } else {
            teamMate = 2;
        }
    } else if ([teamMate2.color isEqual: darkDarkColour]) {
        if (whoToAddPointsTo > 2){
            teamMate = 2;
        } else {
            teamMate = 3;
        }
    } else if ([teamMate3.color isEqual: darkDarkColour]) {
        if (whoToAddPointsTo > 3){
            teamMate = 3;
        } else {
            teamMate = 4;
        }
    } else if ([teamMate4.color isEqual: darkDarkColour]) {
        if (whoToAddPointsTo > 4){
            teamMate = 4;
        } else {
            teamMate = 5;
        }
    } else if ([teamMate5.color isEqual: darkDarkColour]) {
        if (whoToAddPointsTo > 5){
            teamMate = 5;
        } else {
            teamMate = 6;
        }
    }

    //adding main amount of score(or taking away) to both the teammate and main player
    
    //is it a misere call or a normal call
    if (misereCall == true){ //it is a misere
        
        amountOfTricksNeededToWin = 0;

        if ([closedMisere.color isEqual: darkDarkColour]) {
            amountWon = 250;
        } else if ([openMisere.color isEqual: darkDarkColour]) {
            amountWon = 500;
        } else if ([blindMisere.color isEqual: darkDarkColour]) {
            amountWon = 1000;
        }
        
        //check to see if they won any trciks
        //if they did they would have lost
        if (whoToAddPointsTo == 1) {
            if(tricksWonByP1 > amountOfTricksNeededToWin) {
                winPointsForYourBet = false;
            } else {
                winPointsForYourBet = true;
            }
        } else if (whoToAddPointsTo == 2) {
            if(tricksWonByP2 > amountOfTricksNeededToWin) {
                winPointsForYourBet = false;
            } else {
                winPointsForYourBet = true;
            }
        } else if (whoToAddPointsTo == 3) {
            if(tricksWonByP3 > amountOfTricksNeededToWin) {
                winPointsForYourBet = false;
            } else {
                winPointsForYourBet = true;
            }
        } else if (whoToAddPointsTo == 4) {
            if(tricksWonByP4 > amountOfTricksNeededToWin) {
                winPointsForYourBet = false;
            } else {
                winPointsForYourBet = true;
            }
        } else if (whoToAddPointsTo == 5) {
            if(tricksWonByP5 > amountOfTricksNeededToWin) {
                winPointsForYourBet = false;
            } else {
                winPointsForYourBet = true;
            }
        } else if (whoToAddPointsTo == 6) {
            if(tricksWonByP6 > amountOfTricksNeededToWin) {
                winPointsForYourBet = false;
            } else {
                winPointsForYourBet = true;
            }
        }
        
        
        //did they win or lose the bet??
        if (winPointsForYourBet == true){ // they won the bet so they gain points
            
            //add points to player
            if (whoToAddPointsTo == 1) {
                p1Score = p1Score + amountWon;
            } else if (whoToAddPointsTo == 2) {
                p2Score = p2Score + amountWon;
            } else if (whoToAddPointsTo == 3) {
                p3Score = p3Score + amountWon;
            } else if (whoToAddPointsTo == 4) {
                p4Score = p4Score + amountWon;
            } else if (whoToAddPointsTo == 5) {
                p5Score = p5Score + amountWon;
            } else if (whoToAddPointsTo == 6) {
                p6Score = p6Score + amountWon;
            }
            
            //add points to teammate
            if (teamMate == 1) {
                p1Score = p1Score + amountWon;
            } else if (teamMate == 2) {
                p2Score = p2Score + amountWon;
            } else if (teamMate == 3) {
                p3Score = p3Score + amountWon;
            } else if (teamMate == 4) {
                p4Score = p4Score + amountWon;
            } else if (teamMate == 5) {
                p5Score = p5Score + amountWon;
            } else if (teamMate == 6) {
                p6Score = p6Score + amountWon;
            }
            
        } else if (winPointsForYourBet == false){ // they lost the bet so now they lose ponits
            
            //remove points from player
            if (whoToAddPointsTo == 1) {
                p1Score = p1Score - amountWon;
            } else if (whoToAddPointsTo == 2) {
                p2Score = p2Score - amountWon;
            } else if (whoToAddPointsTo == 3) {
                p3Score = p3Score - amountWon;
            } else if (whoToAddPointsTo == 4) {
                p4Score = p4Score - amountWon;
            } else if (whoToAddPointsTo == 5) {
                p5Score = p5Score - amountWon;
            } else if (whoToAddPointsTo == 6) {
                p6Score = p6Score - amountWon;
            }
            
            //remove points from teammate
            if (teamMate == 1) {
                p1Score = p1Score - amountWon;
            } else if (teamMate == 2) {
                p2Score = p2Score - amountWon;
            } else if (teamMate == 3) {
                p3Score = p3Score - amountWon;
            } else if (teamMate == 4) {
                p4Score = p4Score - amountWon;
            } else if (teamMate == 5) {
                p5Score = p5Score - amountWon;
            } else if (teamMate == 6) {
                p6Score = p6Score - amountWon;
            }
            
        }

    } else { //not a misere
        
        //counts the number of tricks wo by the team
        if (whoToAddPointsTo == 1) {// player is P1
            tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP1;
            
            if (teamMate == 1) {// teamMate is P1
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP1;
            } else if (teamMate == 2) {// teamMate is P2
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP2;
            } else if (teamMate == 3) {// teamMate is P3
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP3;
            } else if (teamMate == 4) {// teamMate is P4
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP4;
            } else if (teamMate == 5) {// teamMate is P5
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP5;
            } else if (teamMate == 6) {// teamMate is P6
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP6;
            }
            
        } else if (whoToAddPointsTo == 2) {// player is P2
            tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP2;
            
            if (teamMate == 1) {// teamMate is P1
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP1;
            } else if (teamMate == 2) {// teamMate is P2
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP2;
            } else if (teamMate == 3) {// teamMate is P3
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP3;
            } else if (teamMate == 4) {// teamMate is P4
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP4;
            } else if (teamMate == 5) {// teamMate is P5
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP5;
            } else if (teamMate == 6) {// teamMate is P6
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP6;
            }
        } else if (whoToAddPointsTo == 3) {// player is P3
            tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP3;
            
            if (teamMate == 1) {// teamMate is P1
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP1;
            } else if (teamMate == 2) {// teamMate is P2
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP2;
            } else if (teamMate == 3) {// teamMate is P3
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP3;
            } else if (teamMate == 4) {// teamMate is P4
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP4;
            } else if (teamMate == 5) {// teamMate is P5
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP5;
            } else if (teamMate == 6) {// teamMate is P6
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP6;
            }
        } else if (whoToAddPointsTo == 4) {// player is P4
            tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP4;
            
            if (teamMate == 1) {// teamMate is P1
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP1;
            } else if (teamMate == 2) {// teamMate is P2
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP2;
            } else if (teamMate == 3) {// teamMate is P3
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP3;
            } else if (teamMate == 4) {// teamMate is P4
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP4;
            } else if (teamMate == 5) {// teamMate is P5
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP5;
            } else if (teamMate == 6) {// teamMate is P6
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP6;
            }
        } else if (whoToAddPointsTo == 5) {// player is P5
            tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP5;
            
            if (teamMate == 1) {// teamMate is P1
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP1;
            } else if (teamMate == 2) {// teamMate is P2
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP2;
            } else if (teamMate == 3) {// teamMate is P3
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP3;
            } else if (teamMate == 4) {// teamMate is P4
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP4;
            } else if (teamMate == 5) {// teamMate is P5
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP5;
            } else if (teamMate == 6) {// teamMate is P6
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP6;
            }
        } else if (whoToAddPointsTo == 6) {// player is P6
            tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP6;
            
            if (teamMate == 1) {// teamMate is P1
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP1;
            } else if (teamMate == 2) {// teamMate is P2
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP2;
            } else if (teamMate == 3) {// teamMate is P3
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP3;
            } else if (teamMate == 4) {// teamMate is P4
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP4;
            } else if (teamMate == 5) {// teamMate is P5
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP5;
            } else if (teamMate == 6) {// teamMate is P6
                tricksWonByBettingTeam = tricksWonByBettingTeam + tricksWonByP6;
            }
        }
        
        //checks to see how many tricks they needed to win
        //also add points to how much they will win because the more they bet the better their reward
        if ([betting6.color isEqual: darkDarkColour]) {
            amountOfTricksNeededToWin = 6;
        } else if ([betting7.color isEqual: darkDarkColour]) {
            amountOfTricksNeededToWin = 7;
            amountWon = amountWon + 100;
        } else if ([betting8.color isEqual: darkDarkColour]) {
            amountOfTricksNeededToWin = 8;
            amountWon = amountWon + 200;
        } else if ([betting9.color isEqual: darkDarkColour]) {
            amountOfTricksNeededToWin = 9;
            amountWon = amountWon + 300;
        } else if ([betting10.color isEqual: darkDarkColour]) {
            amountOfTricksNeededToWin = 10;
            amountWon = amountWon + 400;
        }
        
        //checks to see if they won enough tricks to call their bet
        //(win points or lose points)
        if (tricksWonByBettingTeam >= amountOfTricksNeededToWin) {
            winPointsForYourBet = true;
        } else {
            winPointsForYourBet = false;
        }
        
        //works out the rest for how much they have won
        if ([suit1.color isEqual: darkDarkColour]) { //spades
            amountWon = amountWon + 40;
        } else if ([suit2.color isEqual: darkDarkColour]) { //clubs
            amountWon = amountWon + 60;
        } else if ([suit3.color isEqual: darkDarkColour]) { //diamonds
            amountWon = amountWon + 80;
        } else if ([suit4.color isEqual: darkDarkColour]) { //hearts
            amountWon = amountWon + 100;
        } else if ([suit5.color isEqual: darkDarkColour]) { //nooes
            amountWon = amountWon + 120;
        }
        
        //smash! (won all ten tricks but didnt bet above 250 points - they then straight away get 250 for the bet)
        if ((tricksWonByBettingTeam == 10) && (amountWon < 250)) {
            amountWon = 250;
        }
        
        //adds the scores to the player and teammate
        if (winPointsForYourBet == true){ // they won the bet so they gain points
            
            //add points to player
            if (whoToAddPointsTo == 1) {
                p1Score = p1Score + amountWon;
            } else if (whoToAddPointsTo == 2) {
                p2Score = p2Score + amountWon;
            } else if (whoToAddPointsTo == 3) {
                p3Score = p3Score + amountWon;
            } else if (whoToAddPointsTo == 4) {
                p4Score = p4Score + amountWon;
            } else if (whoToAddPointsTo == 5) {
                p5Score = p5Score + amountWon;
            } else if (whoToAddPointsTo == 6) {
                p6Score = p6Score + amountWon;
            }
            
            //add points to teammate
            if (teamMate == 1) {
                p1Score = p1Score + amountWon;
            } else if (teamMate == 2) {
                p2Score = p2Score + amountWon;
            } else if (teamMate == 3) {
                p3Score = p3Score + amountWon;
            } else if (teamMate == 4) {
                p4Score = p4Score + amountWon;
            } else if (teamMate == 5) {
                p5Score = p5Score + amountWon;
            } else if (teamMate == 6) {
                p6Score = p6Score + amountWon;
            }
            
        } else if (winPointsForYourBet == false){ // they lost the bet so now they lose ponits
            
            //remove points from player
            if (whoToAddPointsTo == 1) {
                p1Score = p1Score - amountWon;
            } else if (whoToAddPointsTo == 2) {
                p2Score = p2Score - amountWon;
            } else if (whoToAddPointsTo == 3) {
                p3Score = p3Score - amountWon;
            } else if (whoToAddPointsTo == 4) {
                p4Score = p4Score - amountWon;
            } else if (whoToAddPointsTo == 5) {
                p5Score = p5Score - amountWon;
            } else if (whoToAddPointsTo == 6) {
                p6Score = p6Score - amountWon;
            }
            
            //remove points from teammate
            if (teamMate == 1) {
                p1Score = p1Score - amountWon;
            } else if (teamMate == 2) {
                p2Score = p2Score - amountWon;
            } else if (teamMate == 3) {
                p3Score = p3Score - amountWon;
            } else if (teamMate == 4) {
                p4Score = p4Score - amountWon;
            } else if (teamMate == 5) {
                p5Score = p5Score - amountWon;
            } else if (teamMate == 6) {
                p6Score = p6Score - amountWon;
            }
            
        }
        
        //removes the player and teammates trick total so they don't get more points for each trick they won
        if ((whoToAddPointsTo == 1)||(teamMate == 1)) {
            tricksWonByP1 = 0;
        }
        if ((whoToAddPointsTo == 2)||(teamMate == 2)) {
            tricksWonByP2 = 0;
        }
        if ((whoToAddPointsTo == 3)||(teamMate == 3)) {
            tricksWonByP3 = 0;
        }
        if ((whoToAddPointsTo == 4)||(teamMate == 4)) {
            tricksWonByP4 = 0;
        }
        if ((whoToAddPointsTo == 5)||(teamMate == 5)) {
            tricksWonByP5 = 0;
        }
        if ((whoToAddPointsTo == 6)||(teamMate == 6)) {
            tricksWonByP6 = 0;
        }
        
        
        //adding points(10) to all the other players for each trick the won
        p1Score = p1Score + (tricksWonByP1*10);
        p2Score = p2Score + (tricksWonByP2*10);
        p3Score = p3Score + (tricksWonByP3*10);
        p4Score = p4Score + (tricksWonByP4*10);
        p5Score = p5Score + (tricksWonByP5*10);
        p6Score = p6Score + (tricksWonByP6*10);

    }
    
    
    
    
}

-(void)addTrickScores:(SKSpriteNode*)trick{
    
    if ([trick.name isEqual:@"P1"]){
        tricksWonByP1 = tricksWonByP1 + 1;
    } else if ([trick.name isEqual:@"P2"]){
        tricksWonByP2 = tricksWonByP2 + 1;
    } else if ([trick.name isEqual:@"P3"]){
        tricksWonByP3 = tricksWonByP3 + 1;
    }else if ([trick.name isEqual:@"P4"]){
        tricksWonByP4 = tricksWonByP4 + 1;
    }else if ([trick.name isEqual:@"P5"]){
        tricksWonByP5 = tricksWonByP5 + 1;
    }else if ([trick.name isEqual:@"P6"]){
        tricksWonByP6 = tricksWonByP6 + 1;
    }
}

-(void)pointsMenuIsOff {
    
    pauseOn = false;
    greyFadedBackground.position = CGPointMake(self.size.width*2, self.size.height/2);
    //addScoreMenu.position = CGPointMake(self.size.width*2, self.size.height/2);
    [addScoreMenu runAction: [SKAction moveTo:CGPointMake(self.size.width/2, self.size.height/2*3) duration:speedOfMovingStuff]];
    //make all the tricks equal to empty again
    trick1.name  = @"EmptyTrick";
    trick1.texture = [SKTexture textureWithImageNamed:@"Trick1"];
    trick2.name  = @"EmptyTrick";
    trick2.texture = [SKTexture textureWithImageNamed:@"Trick2"];
    trick3.name  = @"EmptyTrick";
    trick3.texture = [SKTexture textureWithImageNamed:@"Trick3"];
    trick4.name  = @"EmptyTrick";
    trick4.texture = [SKTexture textureWithImageNamed:@"Trick4"];
    trick5.name  = @"EmptyTrick";
    trick5.texture = [SKTexture textureWithImageNamed:@"Trick5"];
    trick6.name  = @"EmptyTrick";
    trick6.texture = [SKTexture textureWithImageNamed:@"Trick6"];
    trick7.name  = @"EmptyTrick";
    trick7.texture = [SKTexture textureWithImageNamed:@"Trick7"];
    trick8.name  = @"EmptyTrick";
    trick8.texture = [SKTexture textureWithImageNamed:@"Trick8"];
    trick9.name  = @"EmptyTrick";
    trick9.texture = [SKTexture textureWithImageNamed:@"Trick9"];
    trick10.name  = @"EmptyTrick";
    trick10.texture = [SKTexture textureWithImageNamed:@"Trick10"];
    
    //make all the trick won tallying equal to zero again
    tricksWonByP1 = 0;
    tricksWonByP2 = 0;
    tricksWonByP3 = 0;
    tricksWonByP4 = 0;
    tricksWonByP5 = 0;
    tricksWonByP6 = 0;
    tricksWonByBettingTeam = 0;
    amountWon = 0;
    
    //update scores for all the players
    player1sScore.text = [NSString stringWithFormat:@"%d",p1Score];
    player2sScore.text = [NSString stringWithFormat:@"%d",p2Score];
    player3sScore.text = [NSString stringWithFormat:@"%d",p3Score];
    player4sScore.text = [NSString stringWithFormat:@"%d",p4Score];
    player5sScore.text = [NSString stringWithFormat:@"%d",p5Score];
    player6sScore.text = [NSString stringWithFormat:@"%d",p6Score];

    //incase the misere was on when it was canceled or submitted
    [self misereOff];
    
}

-(void)misereOn {
    
    misereCall = true;
    
    closedMisere.color = darkDarkColour;
    
    //move the misere buttons onto the view
    closedMisere.position = CGPointMake(0, bettingBar.position.y);
    openMisere.position = CGPointMake(0, suitBar.position.y);
    blindMisere.position = CGPointMake(0,openMisere.position.y - title.frame.size.height);

    if (amountOfPlayers == 3) {
        whoWonTheTricks.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whoWonTheTricks.frame.size.width/2 +10,blindMisere.position.y - blindMisere.frame.size.height);
        tricksBar1To5.position = CGPointMake(0,whoWonTheTricks.position.y - 17/2*3);
        tricksBar6To10.position = CGPointMake(0,tricksBar1To5.position.y - tricksBar1To5.size.height);
        
    } else {
        whosOnYourTeam.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whosOnYourTeam.frame.size.width/2 +10,blindMisere.position.y - blindMisere.frame.size.height);
        whosOnYourTeamBar.position = CGPointMake(0,whosOnYourTeam.position.y - whosOnYourTeam.frame.size.height/2*3);
        
        whoWonTheTricks.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whoWonTheTricks.frame.size.width/2 +10,whosOnYourTeamBar.position.y - whosOnYourTeamBar.frame.size.height);
        tricksBar1To5.position = CGPointMake(0,whoWonTheTricks.position.y - 17/2*3);
        tricksBar6To10.position = CGPointMake(0,tricksBar1To5.position.y - tricksBar1To5.size.height);
    }
    
   
    
    //making all the other, now unnessesary, stuff go away
    misereButton.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    bettingBar.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    suitBar.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    
    
    
    
}

-(void)misereOff {
    
    misereCall = false;
    
    bettingBar.position = CGPointMake(0,title.position.y - title.frame.size.height);
    suitBar.position = CGPointMake(0,bettingBar.position.y - title.frame.size.height);
    if (amountOfPlayers == 3) {
    } else {
        whosOnYourTeam.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whosOnYourTeam.frame.size.width/2 +10,suitBar.position.y - suitBar.frame.size.height);
        whosOnYourTeamBar.position = CGPointMake(0,whosOnYourTeam.position.y - whosOnYourTeam.frame.size.height/2*3);
    }
    if (amountOfPlayers == 3) {
        //tricks need to be higher on the screen if only three players because the whosOnYourTeam bar isn't there
        whoWonTheTricks.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whoWonTheTricks.frame.size.width/2 +10,suitBar.position.y - suitBar.frame.size.height);
    } else {
        whoWonTheTricks.position = CGPointMake(-addScoreMenu.frame.size.width/2 + whoWonTheTricks.frame.size.width/2 +10,whosOnYourTeamBar.position.y - whosOnYourTeamBar.frame.size.height);
    }
    tricksBar1To5.position = CGPointMake(0,whoWonTheTricks.position.y - 17/2*3);
    tricksBar6To10.position = CGPointMake(0,tricksBar1To5.position.y - tricksBar1To5.size.height);

    misereButton.position = CGPointMake(0,tricksBar6To10.position.y - title.frame.size.height);
    closedMisere.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    openMisere.position = CGPointMake(self.scene.size.width, self.scene.size.height);
    blindMisere.position = CGPointMake(self.scene.size.width, self.scene.size.height);
}
@end
