//
//  ViewController.m
//  popup
//
//  Created by Carlos D. Santiago on 5/17/17.
//  Copyright © 2017 Carlos D. Santiago. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Do any additional setup after loading the view.
	NSUserDefaults * prefs = [NSUserDefaults standardUserDefaults];

	//	Fetch our dictionary to maintain from pref
	self.location = [prefs objectForKey:@"location"];
	if (!([_location isKindOfClass:[NSMutableDictionary class]])) {
		self.location = [NSMutableDictionary dictionary];
	}

	//	Fetch and/or initialize our dictionary keys
	NSArray * weatherLocationKeys = [prefs arrayForKey:@"weatherLocationKeys"];
	if (!([weatherLocationKeys isKindOfClass:[NSArray class]])) {
		weatherLocationKeys = @[ @"cc", @"city", @"lat", @"lon", @"loc", @"st", @"zip" ];
		[prefs setObject:weatherLocationKeys forKey:@"weatherLocationKeys"];
	}
}


- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

#pragma mark - IBAction

- (IBAction)cancel:(id)sender {
	[self.view.window performClose:sender];
	[NSApp terminate:sender];
}

- (IBAction)save:(id)sender {
	NSUserDefaults * prefs = [NSUserDefaults standardUserDefaults];

	[prefs setObject:_location forKey:@"location"];
	[self cancel:sender];
}

//	method idea http://stackoverflow.com/questions/12075195/how-to-get-nspopupbutton-selected-object

- (IBAction)selectedKeyChanged:(id)sender {
	NSIndexSet * selectedRowIndices = [_weatherTable selectedRowIndexes];
	if (!selectedRowIndices || selectedRowIndices.count > 1) {
		return;
	}

	NSDictionaryControllerKeyValuePair * kvp = [_weatherController.arrangedObjects objectAtIndex:selectedRowIndices.firstIndex];
	NSLog(@"%@", kvp);
}

#pragma mark - NSMenuDelegate

- (void)menuDidClose:(NSMenu*)menu {
	NSLog(@"%@ %@", self.className, NSStringFromSelector(_cmd));
}

@end
