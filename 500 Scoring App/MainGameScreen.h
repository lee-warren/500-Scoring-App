//
//  MainGameScreen.h
//  500 Scoring App
//
//  Created by Lee Warren on 31/01/2015.
//  Copyright (c) 2015 Lee Warren. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface MainGameScreen : SKScene {
    
    //saving player names and stuff
    NSUserDefaults *defaults;
    
    //helps decide the size of everything - based on how many players buttons are needed on the screen
    int amountOfPlayers;
    int p1Score;
    int p2Score;
    int p3Score;
    int p4Score;
    int p5Score;
    int p6Score;
    
    //colours for buttons and stuff
    
    UIColor *greyColour;
    UIColor *darkGreyColour;

    UIColor *redColour;
    UIColor *darkRedColour;
    UIColor *darkDarkRedColour;
    
    UIColor *blueColour;
    UIColor *darkBlueColour;
    UIColor *darkDarkBlueColour;

    UIColor *greenColour;
    UIColor *darkGreenColour;
    UIColor *darkDarkGreenColour;

    UIColor *yellowColour;
    UIColor *darkYellowColour;
    UIColor *darkDarkYellowColour;

    UIColor *purpleColour;
    UIColor *darkPurpleColour;
    UIColor *darkDarkPurpleColour;

    UIColor *orangeColour;
    UIColor *darkOrangeColour;
    UIColor *darkDarkOrangeColour;
    
    UIColor *colour;
    UIColor *darkColour;
    UIColor *darkDarkColour;

    NSString *mainFont;
    
    //the speed the addpoints screen and the setting screen moves
    double speedOfMovingStuff;
    
    BOOL pauseOn;
    //add score menu stuff
    SKSpriteNode *greyFadedBackground;
    SKSpriteNode *addScoreMenu;
        //stuff that goes in the score menu
        SKLabelNode *title;
        SKSpriteNode *bettingBar;
            SKSpriteNode *betting6;
            SKSpriteNode *betting7;
            SKSpriteNode *betting8;
            SKSpriteNode *betting9;
            SKSpriteNode *betting10;
        SKSpriteNode *suitBar;
            SKSpriteNode *suit1; //spades
            SKSpriteNode *suit2; //clubs
            SKSpriteNode *suit3; //diamonds
            SKSpriteNode *suit4; //hearts
            SKSpriteNode *suit5; //noes
        SKLabelNode *whosOnYourTeam; // just a label that tells you whats happening
        SKSpriteNode *whosOnYourTeamBar;
            SKSpriteNode *teamMate1;
            SKSpriteNode *teamMate2;
            SKSpriteNode *teamMate3;
            SKSpriteNode *teamMate4;
            SKSpriteNode *teamMate5;
                int teamMate;
        SKLabelNode *whoWonTheTricks; // just a label that tells you whats happening
        SKSpriteNode *tricksBar1To5;
            SKSpriteNode *trick1; //you can select between all the players for each trick#
            SKSpriteNode *trick2; //after pressing sumbit the app will calculate if you won enough tricks
            SKSpriteNode *trick3;
            SKSpriteNode *trick4;
            SKSpriteNode *trick5;
        SKSpriteNode *tricksBar6To10;
            SKSpriteNode *trick6;
            SKSpriteNode *trick7;
            SKSpriteNode *trick8;
            SKSpriteNode *trick9;
            SKSpriteNode *trick10;
                int tricksWonByP1;
                int tricksWonByP2;
                int tricksWonByP3;
                int tricksWonByP4;
                int tricksWonByP5;
                int tricksWonByP6;
                int tricksWonByBettingTeam;
        SKSpriteNode *misereButton;
            SKSpriteNode *closedMisere;
            SKSpriteNode *openMisere;
            SKSpriteNode *blindMisere;
            BOOL misereCall;
        SKSpriteNode *cancelButton;
        SKSpriteNode *submitButton;
            BOOL tricksHaveBeenFilled;
            int amountOfTricksNeededToWin;
            BOOL winPointsForYourBet;
            int amountWon;

    
    int whoToAddPointsTo;
    
    BOOL dropDownMenuOn;
    SKSpriteNode *menuBar;
        SKSpriteNode *returnToMenuButton;
        SKSpriteNode *menuDropdownButton;
        SKSpriteNode *acceptButton;
    
    SKSpriteNode *dropDownMenu;
        SKSpriteNode *customScoringButton;
    
    NSString *whatKindOfPauseMenu;
    SKSpriteNode *dropDownReturnToMenuQuestion;
        SKLabelNode *sureYouWantToGoToMenuLine1;
        SKLabelNode *sureYouWantToGoToMenuLine2;
        SKSpriteNode *yesReturnToMenu;
        SKSpriteNode *noDontReturnToMenu;

    

    SKSpriteNode *player1Button;
        SKLabelNode *player1sScore;
        SKSpriteNode *addButton1;
        SKSpriteNode *minusButton1;
    
    SKSpriteNode *player2Button;
        SKLabelNode *player2sScore;
        SKSpriteNode *addButton2;
        SKSpriteNode *minusButton2;
    
    SKSpriteNode *player3Button;
        SKLabelNode *player3sScore;
        SKSpriteNode *addButton3;
        SKSpriteNode *minusButton3;
    
    SKSpriteNode *player4Button;
        SKLabelNode *player4sScore;
        SKSpriteNode *addButton4;
        SKSpriteNode *minusButton4;
    
    SKSpriteNode *player5Button;
        SKLabelNode *player5sScore;
        SKSpriteNode *addButton5;
        SKSpriteNode *minusButton5;
    
    SKSpriteNode *player6Button;
        SKLabelNode *player6sScore;
        SKSpriteNode *addButton6;
        SKSpriteNode *minusButton6;
    
}

@end
