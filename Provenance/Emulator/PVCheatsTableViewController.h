//
//  PVCheatsTableViewController.h
//  Provenance
//
//  Created by Arnaud Ferreri on 12/23/15.
//  Copyright © 2015 James Addyman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PVCheatManager.h"

@interface PVCheatsTableViewController : UITableViewController

@property (nonatomic, retain) PVCheatManager* cheatManager;

-(id)initWithCheatManager:(PVCheatManager*)cheatManager;

@end