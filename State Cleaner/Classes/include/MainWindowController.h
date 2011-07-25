/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@interface MainWindowController: NSWindowController < NSTableViewDataSource, NSTableViewDelegate >
{
@protected
    
    NSFileManager       * fm;
    NSTableView         * table;
    NSMutableDictionary * states;
    NSMutableArray      * apps;
    NSString            * path;
    
@private
    
    id r1;
    id r2;
}

@property( nonatomic, assign ) IBOutlet NSTableView * table;

- ( IBAction )selectAll: ( id )sender;
- ( IBAction )removeSelected: ( id )sender;

@end
