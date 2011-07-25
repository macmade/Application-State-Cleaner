/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "MainWindowController.h"
#import "Application.h"

@interface MainWindowController( Private )

- ( void )getApplications;
- ( void )removeAppStates: ( id )sender;

@end

@implementation MainWindowController( Private )

- ( void )getApplications
{
    Application * app;
    NSArray     * dirs;
    NSString    * dir;
    NSString    * bundleID;
    
    [ apps release ];
    
    apps = [ [ NSMutableArray alloc ] initWithCapacity: 100 ];
    dirs = [ [ fm contentsOfDirectoryAtPath: path error: NULL ] retain ];
    
    for( dir in dirs )
    {
        bundleID = [ dir stringByReplacingOccurrencesOfString: @".savedState" withString: @"" ];
        
        if( [ bundleID isEqualToString: @"com.eosgarden.Application-State-Cleaner" ] )
        {
            continue;
        }
        
        app = [ Application applicationWithBundleID: bundleID ];
        
        if( app != nil )
        {
            [ apps addObject: app ];
        }
    }
    
    [ apps sortUsingComparator:
        ( NSComparator )^( id obj1, id obj2 )
        {
            Application * app1;
            Application * app2;
            
            app1 = ( Application * )obj1;
            app2 = ( Application * )obj2;
            
            return [ app1.name caseInsensitiveCompare: app2.name ];
        }
     ];
}

- ( void )removeAppStates: ( id )sender
{
    NSString * bundleID;
    NSString * dir;
    
    for( bundleID in states )
    {
        if( [ [ states objectForKey: bundleID ] boolValue ] )
        {
            dir = [ NSString stringWithFormat: @"%@/Library/Saved Application State/%@.savedState", NSHomeDirectory(), bundleID ];
            
            [ fm removeItemAtPath: dir error: NULL ];
        }
    }
    
    [ self getApplications ];
    [ table reloadData ];
    [ progress setHidden: YES ];
    [ progress stopAnimation: nil ];
    [ sender setHidden: NO ];
}

@end

@implementation MainWindowController

@synthesize table;
@synthesize view;
@synthesize removeButton;
@synthesize progress;

#pragma mark - NSWindowController

- ( id )init
{
    if( ( self = [ super initWithWindowNibName: @"MainWindow" ] ) )
    {
        fm     = [ NSFileManager defaultManager ];
        states = [ [ NSMutableDictionary alloc ] initWithCapacity: 100 ];
        path   = [ [ NSString stringWithFormat: @"%@/Library/Saved Application State/", NSHomeDirectory() ] retain ];
        
        [ self getApplications ];
    }
    
    return self;
}

- ( void )dealloc
{
    [ states release ];
    [ apps   release ];
    
    [ super dealloc ];
}

- ( void )awakeFromNib
{
    [ progress setHidden: YES ];
    
    table.dataSource = self;
    table.delegate   = self;
}

#pragma mark - IBActions

- ( IBAction )selectAll: ( id )sender
{
    NSButton    * btn;
    NSNumber    * num;
    Application * app;
    
    btn = ( NSButton * )sender;
    
    if( selectAll == NO )
    {
        selectAll = YES;
        num       = [ NSNumber numberWithBool: YES ];
        
        [ btn setTitle: NSLocalizedString( @"DeselectAllApps", nil ) ];
    }
    else
    {
        selectAll = NO;
        num       = [ NSNumber numberWithBool: NO ];
        
        [ btn setTitle: NSLocalizedString( @"SelectAllApps", nil ) ];
    }
    
    for( app in apps )
    {
        [ states setObject: num forKey: app.bundleID ];
    }
    
    [ table reloadData ];
}

- ( IBAction )removeSelected: ( id )sender
{
    [ removeButton setHidden: YES ];
    [ progress setHidden: NO ];
    [ progress startAnimation: sender ];
    [ NSThread detachNewThreadSelector: @selector( removeAppStates: ) toTarget: self withObject: sender ];
}

#pragma mark - NSTableViewDataSource

- ( NSInteger )numberOfRowsInTableView: ( NSTableView * )tableView
{
    ( void )tableView;
    
    return [ apps count ];
}

- ( id )tableView: ( NSTableView * )tableView objectValueForTableColumn: ( NSTableColumn * )tableColumn row: ( NSInteger )row
{
    Application * app;
    
    app = [ apps objectAtIndex: row ];
    
    ( void )tableView;
    ( void )tableColumn;
    
    if( [ [ tableColumn identifier ] isEqualToString: @"image" ] )
    {
        return app.icon;
    }
    else if( [ [ tableColumn identifier ] isEqualToString: @"bundle" ] )
    {
        return app.bundleID;
    }
    
    return [ states objectForKey: app.bundleID ];
}

- ( void )tableView: ( NSTableView * )tableView setObjectValue: ( id )value forTableColumn: ( NSTableColumn * )tableColumn row: ( NSInteger )row
{
    Application * app;
    
    ( void )tableView;
    ( void )value;
    ( void )tableColumn;
    ( void )row;
    
    app = [ apps objectAtIndex: row ];
    
    [ states setObject: value forKey: app.bundleID ];
}

#pragma mark - NSTableViewDelegate

- ( void )tableView: ( NSTableView * )tableView willDisplayCell: ( id )cell forTableColumn: ( NSTableColumn * )tableColumn row: ( NSInteger )row
{
    Application  * app;
    NSButtonCell * buttonCell;
    
    ( void )tableView;
    
    if( [ [ tableColumn identifier ] isEqualToString: @"appname" ] )
    {
        buttonCell = ( NSButtonCell * )cell;
        app        = [ apps objectAtIndex: row ];
        
        [ buttonCell setTitle: app.name ];
    }
}

@end
