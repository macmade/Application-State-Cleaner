/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "AboutWindowController.h"

@implementation AboutWindowController

@synthesize version;

#pragma mark - NSWindowController

- ( id )init
{
    if( ( self = [ super initWithWindowNibName: @"AboutWindow" ] ) )
    {}
    
    return self;
}

- ( void )dealloc
{
    [ super dealloc ];
}

- ( void )awakeFromNib
{
    [ version setStringValue: [ [ NSBundle mainBundle ] objectForInfoDictionaryKey: @"CFBundleShortVersionString" ] ];
}

- ( IBAction )close: ( id )sender
{
    ( void )sender;
    
    [ self.window close ];
}

@end
