/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@class MainWindowController;
@class AboutWindowController;

@interface ApplicationDelegate: NSObject < NSApplicationDelegate >
{
@protected
    
    MainWindowController  * mainWindow;
    AboutWindowController * aboutWindow;
    
@private
    
    id r1;
    id r2;
}

- ( IBAction )showAboutWindow: ( id )sender;

@end
