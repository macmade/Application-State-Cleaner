/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@interface AboutWindowController: NSWindowController
{
@protected
    
    NSTextField * version;
    
@private
    
    id r1;
    id r2;
}

@property( nonatomic, assign ) IBOutlet NSTextField * version;

- ( IBAction )close: ( id )sender;

@end
