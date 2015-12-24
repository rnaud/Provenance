//
//  PVCheatManager.h
//  Provenance
//
//  Created by Arnaud Ferreri on 12/23/15.
//  Copyright © 2015 James Addyman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PVGame.h"

@class PVEmulatorCore;

@interface PVCheatManager : NSObject

@property (nonatomic, retain) NSMutableArray* cheats;
@property (nonatomic, retain) PVEmulatorCore* core;
@property (nonatomic, retain) PVGame* game;

-(id)initWithGame:(PVGame*)game andCore:(PVEmulatorCore*)core;

-(void)addCheat:(NSString*)cheat;
-(void)removeCheat:(NSString*)cheat;
-(BOOL)hasActiveCheat:(NSString*)cheat;
-(void)toggleCheat:(NSString*)cheat;
-(NSArray*)availableCheats;

@end
