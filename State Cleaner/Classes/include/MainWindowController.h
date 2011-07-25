/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@interface MainWindowController: NSWindowController
{
@protected
    
    NSTableView * table;
    
@private
    
    id r1;
    id r2;
}

@property( nonatomic, assign ) IBOutlet NSTableView * table;

@end
