/*******************************************************************************
 * Copyright (c) 2011, eosgarden
 * All rights reserved
 ******************************************************************************/

/* $Id$ */

#import "MainWindowController.h"
#import "Application.h"

@implementation MainWindowController

@synthesize table;

#pragma mark - NSWindowController

- ( id )init
{
    Application * app;
    NSArray     * dirs;
    NSString    * dir;
    
    if( ( self = [ super initWithWindowNibName: @"MainWindow" ] ) )
    {
        fm     = [ NSFileManager defaultManager ];
        states = [ [ NSMutableDictionary alloc ] initWithCapacity: 100 ];
        apps   = [ [ NSMutableArray alloc ] initWithCapacity: 100 ];
        path   = [ NSString stringWithFormat: @"%@/Library/Saved Application State/", NSHomeDirectory() ];
        dirs   = [ [ fm contentsOfDirectoryAtPath: path error: NULL ] retain ];
        
        for( dir in dirs )
        {
            app = [ Application applicationWithBundleID: [ dir stringByReplacingOccurrencesOfString: @".savedState" withString: @"" ] ];
            
            if( app != nil )
            {
                [ apps addObject: app ];
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
    ( void )sender;
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
    
    NSLog( @"%@", value );
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
