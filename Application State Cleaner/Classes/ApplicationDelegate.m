/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "ApplicationDelegate.h"
#import "MainWindowController.h"

@implementation ApplicationDelegate

- ( void )applicationDidFinishLaunching: ( NSNotification * )notification
{
    ( void )notification;
    
    mainWindow = [ MainWindowController new ];
    
    [ mainWindow.window center ];
    [ mainWindow showWindow: nil ];
}

@end
