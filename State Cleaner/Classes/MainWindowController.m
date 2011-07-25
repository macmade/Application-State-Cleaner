/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "MainWindowController.h"

@implementation MainWindowController

@synthesize table;

- ( id )init
{
    if( ( self = [ super initWithWindowNibName: @"MainWindow" ] ) )
    {}
    
    return self;
}

@end
