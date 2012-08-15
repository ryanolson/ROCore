//
//  TableWithHeaderViewController.m
//  SplitItCD
//
//  Created by Ryan Olson on 10/13/11.
//  Copyright (c) 2011 SplitIt LLC. All rights reserved.
//

#define MAX_WEBVIEW_HEIGHT 150

#import "ROTableViewController.h"

@interface ROTableViewController ()
{
    UITableViewStyle __myStyle;
}
@end

@implementation ROTableViewController
@synthesize tableView = _tableView;
@synthesize plainBackGroundColor = _plainBackgroudnColor;
@synthesize groundedBackgroundColor = _groupedBackgroundColor;

@synthesize context = _context;
@synthesize fetchedResultsController = __fetchedResultsController;

@synthesize canSave = __canSave;
@synthesize editButton = __editButton;
@synthesize saveButton = __saveButton;
@synthesize doneButton = __doneButton;
@synthesize cancelButton = __cancelButton;

@synthesize accessorySpacer = _accessorySpacer;
@synthesize inReorderingOperation = __inReorderingOperation;


-(id)initWithTableStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        __myStyle = style;
        __canSave = NO;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Lazy Instantiation of Views

-(UIBarButtonItem *)editButton
{
    if (__editButton == nil) {
        __editButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(onEdit:)];
    }
    return __editButton;
}

-(UIBarButtonItem *)saveButton
{
    if (__saveButton == nil) {
        __saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onSave:)];
    }
    return __saveButton;
}

-(UIBarButtonItem *)doneButton
{
    if (__doneButton == nil) {
        __doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onSave:)];
    }
    return __doneButton;
}

-(UIBarButtonItem *)cancelButton
{
    if (__cancelButton == nil) {
        __cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onCancel:)];
    }
    return __cancelButton;
}


-(UITableView *)tableView
{
    if (_tableView == nil) {
       
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:__myStyle];
        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        _tableView.delegate = self;
        _tableView.dataSource = self;
       
        self.view = _tableView;
        if (__myStyle == UITableViewStyleGrouped) {
            self.view.backgroundColor = [UIColor scrollViewTexturedBackgroundColor];
            if (self.groundedBackgroundColor) {
                self.view.backgroundColor = self.groundedBackgroundColor;
            }
        } else {
            self.view.backgroundColor = [UIColor whiteColor];
            // self.view.backgroundColor = COLOR_TABLECELL_BACKGROUND;
            // self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"retina_dust"]];
            if (self.plainBackGroundColor) {
                self.view.backgroundColor = self.plainBackGroundColor;
            }
            // _tableView.separatorColor = [UIColor clearColor];
        }
    }
    return _tableView;
}

-(UIView *)accessorySpacer
{
    if (_accessorySpacer == nil) {
        _accessorySpacer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    }
    return _accessorySpacer;
}


#pragma mark - Methods Resonding to Using Interaction

-(void)setCanSave:(BOOL)canSave
{
    __canSave = canSave;
}

-(void)onSave:(id)sender
{
    return;
}

-(void)onCancel:(id)sender
{
    return;
}

-(void)onEdit:(id)sender
{
    return;
}

#pragma mark - View lifecycle

-(void) updateUI
{
    self.saveButton.enabled = __canSave;
    [self.fetchedResultsController performFetch:NULL];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self tableView];    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];    
    [self updateUI];   
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.tableView = nil;
    self.saveButton = nil;
    self.editButton = nil;
    self.doneButton = nil;
    self.cancelButton = nil;
    self.fetchedResultsController = nil;
    _accessorySpacer = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table Data Source and Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger section_count = 0;
    if (self.fetchedResultsController) {
        section_count = [[self.fetchedResultsController sections] count];
    }
    return section_count;
}

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    NSInteger row_count = 0;
    if (self.fetchedResultsController) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
        row_count = [sectionInfo numberOfObjects];
    }
    return row_count;
}

-(void)setupCell:(UITableViewCell *)cell
{
    // cell.imageView.layer.masksToBounds = YES;
    // cell.imageView.layer.cornerRadius = 5.0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(FALSE, @"Use cellForRowAtIndexPath:withStyle");
    return nil;
    //return [self tableView:tableView cellForRowAtIndexPath:indexPath withStyle:__defaultCellStyle];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withStyle:(UITableViewCellStyle)style
{
    static NSString *ReuseIdentifier = @"ROTableViewCell";
    NSString * identifer = [NSString stringWithFormat:@"%@-%d", ReuseIdentifier, style];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:style reuseIdentifier:identifer];
    }
    
    [self setupCell:cell];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    NSInteger height = 25;
    if (tableView.style == UITableViewStyleGrouped) {
        height = 40;
    } 
    NSString *labelString = [self tableView:tableView titleForHeaderInSection:section];
    if (labelString) return height;
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSInteger height = 25;
    if (tableView.style == UITableViewStyleGrouped) {
        height = 40;
    } 
    NSString *labelString = [self tableView:tableView titleForFooterInSection:section];
    if (labelString) return height;
    return 0;
}

-(BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *returnView = nil;
    if (tableView.style == UITableViewStyleGrouped) {
        
        NSInteger height = [self tableView:tableView heightForHeaderInSection:section];
        if (height == 0) return nil;

        NSInteger indentWidth = 17;
        NSInteger indentHeight = 10;

        returnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, height)];
    
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(indentWidth, indentHeight, tableView.bounds.size.width-indentWidth, height-indentHeight)];
    
        // labelView.textColor = COLOR_TABLECELL_BACKGROUND;
        labelView.shadowColor = [UIColor darkGrayColor];
        labelView.shadowOffset = CGSizeMake(1, 1);
        labelView.font = [UIFont boldSystemFontOfSize:18];
        labelView.text = [self tableView:tableView titleForHeaderInSection:section];
        labelView.backgroundColor = [UIColor clearColor];
        labelView.minimumFontSize = 12;
        labelView.adjustsFontSizeToFitWidth = YES;
    
        [returnView addSubview:labelView];
    } 
    return returnView;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *returnView = nil;
    if (tableView.style == UITableViewStyleGrouped) {
        
        NSInteger height = [self tableView:tableView heightForFooterInSection:section];
        if (height == 0) return nil;
        
        NSInteger indentWidth = 10;
        NSInteger indentHeight = 5;
        
        returnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, height)];
        
        UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(indentWidth, indentHeight, tableView.bounds.size.width-indentWidth*2, height-indentHeight)];
        
        // labelView.textColor = COLOR_TABLECELL_BACKGROUND;
        labelView.shadowColor = [UIColor darkGrayColor];
        labelView.shadowOffset = CGSizeMake(1, 1);
        labelView.font = [UIFont boldSystemFontOfSize:12];
        labelView.text = [self tableView:tableView titleForFooterInSection:section];
        labelView.backgroundColor = [UIColor clearColor];
        labelView.textAlignment = UITextAlignmentCenter;
        labelView.numberOfLines = 2;
        
        [returnView addSubview:labelView];
    } 
    return returnView;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}


-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    return;
}


#pragma mark - NSFetchedResultsControllerDelegate methods

-(NSIndexPath *)shiftedIndexPathForController:(NSFetchedResultsController *)controller atIndexPath:(NSIndexPath *)indexPath
{
    return indexPath;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}


- (void)controller:(NSFetchedResultsController *)controller
  didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
		   atIndex:(NSUInteger)sectionIndex
	 forChangeType:(NSFetchedResultsChangeType)type
{	
    switch(type)
	{
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}


- (void)controller:(NSFetchedResultsController *)controller
   didChangeObject:(id)anObject
	   atIndexPath:(NSIndexPath *)indexPath
	 forChangeType:(NSFetchedResultsChangeType)type
	  newIndexPath:(NSIndexPath *)newIndexPath
{	
    UITableView *tableView = self.tableView;
	
    NSIndexPath *shiftedIndexPath = [self shiftedIndexPathForController:controller atIndexPath:indexPath];
    NSIndexPath *shiftedNewIndexPath = [self shiftedIndexPathForController:controller atIndexPath:newIndexPath];
    
    switch(type)
	{
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:shiftedNewIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:shiftedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
			
        case NSFetchedResultsChangeUpdate:
			[tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:shiftedIndexPath] withRowAnimation:UITableViewRowAnimationNone];
            break;
			
        case NSFetchedResultsChangeMove:
            if (!self.inReorderingOperation) {
                [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:shiftedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
                [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:shiftedNewIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            }
            //[tableView reloadData];
            break;
    }
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}


@end
