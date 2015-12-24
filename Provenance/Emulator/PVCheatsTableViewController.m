//
//  PVCheatsTableViewController.m
//  Provenance
//
//  Created by Arnaud Ferreri on 12/23/15.
//  Copyright © 2015 James Addyman. All rights reserved.
//

#import "PVCheatsTableViewController.h"

@interface PVCheatsTableViewController ()
@end

@implementation PVCheatsTableViewController

-(id)initWithCheatManager:(PVCheatManager*)cheatManager {
    if (self = [super init]) {
        self.cheatManager = cheatManager;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Cheats";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStylePlain target:self action:@selector(closeModal)];
}

-(void)closeModal {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cheatManager.availableCheats.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* CellIdentifier = @"CheatCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    NSDictionary* cheat = self.cheatManager.availableCheats[indexPath.row];
    cell.textLabel.text = [cheat objectForKey:@"name"];
    cell.detailTextLabel.text = [cheat objectForKey:@"description"];
    
    if ([self.cheatManager hasActiveCheat:[cheat objectForKey:@"code"]]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary* cheat = self.cheatManager.availableCheats[indexPath.row];
    NSString* code = [cheat objectForKey:@"code"];
    [self.cheatManager toggleCheat:code];
    [self.tableView reloadData];
}

@end
