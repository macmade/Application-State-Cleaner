/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "GrayView.h"

@implementation GrayView

- ( void )drawRect: ( NSRect )rect
{
    [ [ NSColor colorWithDeviceRed: 0.60 green: 0.60 blue: 0.60 alpha: 1 ] setFill ];
    NSRectFill( rect );
}

@end
