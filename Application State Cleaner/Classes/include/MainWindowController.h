/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@interface MainWindowController: NSWindowController < NSTableViewDataSource, NSTableViewDelegate >
{
@protected
    
    BOOL                  selectAll;
    NSFileManager       * fm;
    NSView              * view;
    NSTableView         * table;
    NSMutableDictionary * states;
    NSMutableArray      * apps;
    NSString            * path;
    NSButton            * removeButton;
    NSProgressIndicator * progress;
    
@private
    
    id r1;
    id r2;
}

@property( nonatomic, assign ) IBOutlet NSTableView         * table;
@property( nonatomic, assign ) IBOutlet NSView              * view;
@property( nonatomic, assign ) IBOutlet NSButton            * removeButton;
@property( nonatomic, assign ) IBOutlet NSProgressIndicator * progress;

- ( IBAction )selectAll: ( id )sender;
- ( IBAction )removeSelected: ( id )sender;

@end
