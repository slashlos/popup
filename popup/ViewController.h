//
//  ViewController.h
//  popup
//
//  Created by Carlos D. Santiago on 5/17/17.
//  Copyright © 2017 Carlos D. Santiago. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (retain) NSMutableDictionary * location;
@property (retain) IBOutlet NSDictionaryController * weatherController;
@property (retain) IBOutlet NSTableView * weatherTable;
@property (retain) IBOutlet NSPopUpButtonCell * keyButtonCell;

@end

