/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

@interface Application: NSObject
{
@protected
    
    NSString * bundleID;
    NSString * path;
    NSString * name;
    NSString * savedStateDirectory;
    NSImage  * icon;
    
@private
    
    id r1;
    id r2;
}

@property( readonly ) NSString * bundleID;
@property( readonly ) NSString * path;
@property( readonly ) NSString * name;
@property( readonly ) NSString * savedStateDirectory;
@property( readonly ) NSImage  * icon;

+ ( Application * )applicationWithBundleID: ( NSString * )bundle;
- ( id )initWithBundleID: ( NSString * )bundle;

@end
