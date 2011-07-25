/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@interface ApplicationDelegate: NSObject < NSApplicationDelegate >
{
@protected
    
    NSWindow * window;
    
@private
    
    id r1;
    id r2;
}

@property( assign ) IBOutlet NSWindow * window;

@end
