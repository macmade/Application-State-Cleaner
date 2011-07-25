/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "BlueView.h"

@implementation BlueView

- ( void )drawRect: ( NSRect )rect
{
    [ [ NSColor colorWithDeviceRed: 0.86 green: 0.88 blue: 0.90 alpha: 1 ] setFill ];
    NSRectFill( rect );
}

@end
