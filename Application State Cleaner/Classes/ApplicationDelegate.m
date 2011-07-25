/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "ApplicationDelegate.h"
#import "MainWindowController.h"
#import "AboutWindowController.h"

@implementation ApplicationDelegate

- ( void )applicationDidFinishLaunching: ( NSNotification * )notification
{
    ( void )notification;
    
    mainWindow = [ MainWindowController new ];
    
    [ mainWindow.window center ];
    [ mainWindow showWindow: nil ];
}

- ( IBAction )showAboutWindow: ( id )sender
{
    ( void )sender;
    
    if( aboutWindow == nil )
    {
        aboutWindow = [ AboutWindowController new ];
    }
    
    [ aboutWindow.window center ];
    [ aboutWindow showWindow: nil ];
}

@end
