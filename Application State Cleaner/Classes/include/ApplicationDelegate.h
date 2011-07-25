/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@class MainWindowController;

@interface ApplicationDelegate: NSObject < NSApplicationDelegate >
{
@protected
    
    MainWindowController * mainWindow;
    
@private
    
    id r1;
    id r2;
}

@end
