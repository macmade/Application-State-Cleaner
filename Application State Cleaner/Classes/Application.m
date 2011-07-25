/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "Application.h"

@implementation Application

@synthesize bundleID;
@synthesize path;
@synthesize name;
@synthesize savedStateDirectory;
@synthesize icon;

+ ( Application * )applicationWithBundleID: ( NSString * )bundle
{
    Application * app;
    
    app = [ [ Application alloc ] initWithBundleID: bundle ];
    
    return [ app autorelease ];
}

- ( id )initWithBundleID: ( NSString * )bundle
{
    NSFileManager * fm;
    NSWorkspace   * wk;
    
    if( ( self = [ super init ] ) )
    {
        fm       = [ NSFileManager defaultManager ];
        wk       = [ NSWorkspace sharedWorkspace ];
        bundleID = [ bundle copy ];
        path     = [ wk absolutePathForAppBundleWithIdentifier: bundleID ];
        
        if( path == nil )
        {
            [ self release ];
            
            return nil;
        }
        
        name                = [ [ fm displayNameAtPath: path ] retain ];
        savedStateDirectory = [ NSString stringWithFormat: @"%@/Library/Saved Application State/%@.savedState", NSHomeDirectory(), bundleID ];
        icon                = [ [ wk iconForFile: path ] retain ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ bundleID            release ];
    [ path                release ];
    [ name                release ];
    [ savedStateDirectory release ];
    [ icon                release ];
    
    [ super dealloc ];
}

@end
