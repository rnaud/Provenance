//
//  PVCheatManager.m
//  Provenance
//
//  Created by Arnaud Ferreri on 12/23/15.
//  Copyright © 2015 James Addyman. All rights reserved.
//

#import "PVCheatManager.h"
#import "PVEmulatorCore.h"

@implementation PVCheatManager

-(id)initWithGame:(PVGame*)game andCore:(PVEmulatorCore*)core {
    if (self = [self init]) {
        self.game = game;
        self.core = core;
    }
    return self;
}

-(instancetype)init {
    if (self = [super init]) {
        self.cheats = @[].mutableCopy;
    }
    return self;
}

-(void)addCheat:(NSString*)cheat {
    [self.cheats addObject:cheat];
    [self.core setCheat:cheat setType:nil setEnabled:YES];
}
-(void)removeCheat:(NSString*)cheat {
    [self.cheats removeObject:cheat];
    [self.core clearCheats];
    for (NSString* cheat in self.cheats) {
        [self.core setCheat:cheat setType:nil setEnabled:YES];
    }
}
-(BOOL)hasActiveCheat:(NSString*)cheat {
    return [self.cheats containsObject:cheat];
}

-(void)toggleCheat:(NSString*)cheat {
    if ([self hasActiveCheat:cheat]) {
        [self removeCheat:cheat];
    } else {
        [self addCheat:cheat];
    }
}

-(NSArray*)availableCheats {
    return @[
             @{@"name": @"Everyone is a ghost",
               @"description": @"Everyone is a ghost on the track",
               @"code": @"67EB-CDA4"
        }
    ];
}

@end
