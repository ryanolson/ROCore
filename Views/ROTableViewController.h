//
//  TableWithHeaderViewController.h
//  SplitItCD
//
//  Created by Ryan Olson on 10/13/11.
//  Copyright (c) 2011 SplitIt LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ModalDelegate <NSObject>
@required
-(void) modalController:(id)controller didSaveWithObject:(id)object;
-(void) modalController:(id)controller didCancelWithObject:(id)object;
@end

@interface ROTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate>
{
    UITableView *_tableView;
    
    UIColor * _plainBackgroudnColor;
    UIColor * _groupedBackgroundColor;
    
    UITableViewCellStyle __defaultCellStyle;
    
    NSManagedObjectContext * _context;
    NSFetchedResultsController *__fetchedResultsController;
    
    BOOL __canSave;
    UIBarButtonItem *__editButton;
    UIBarButtonItem *__saveButton;
    UIBarButtonItem *__doneButton;
    UIBarButtonItem *__cancelButton;
    
    BOOL __inReorderingOperation;
    
    UIView * _accessorySpacer;
}

@property (nonatomic, retain) UITableView * tableView;
@property (nonatomic, retain) UIColor * plainBackGroundColor;
@property (nonatomic, retain) UIColor * groundedBackgroundColor;

@property (nonatomic, retain) NSManagedObjectContext * context;
@property (nonatomic, strong) NSFetchedResultsController * fetchedResultsController;



@property (nonatomic, assign) BOOL canSave;
@property (nonatomic, retain) UIBarButtonItem *editButton;
@property (nonatomic, retain) UIBarButtonItem *saveButton;
@property (nonatomic, retain) UIBarButtonItem *doneButton;
@property (nonatomic, retain) UIBarButtonItem *cancelButton;

@property (nonatomic, assign) BOOL moving;
@property (nonatomic, assign) BOOL inReorderingOperation;

@property (readonly) UIView * accessorySpacer;


-(id)initWithTableStyle:(UITableViewStyle)style;

-(void)updateUI;
-(void)onCancel:(id)sender;
-(void)onSave:(id)sender;
-(void)onEdit:(id)sender;

-(UITableViewCell *)setupCell:(UITableViewCell *)cell;
-(NSIndexPath *)shiftedIndexPathForController:(NSFetchedResultsController *)controller atIndexPath:(NSIndexPath *)indexPath;
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath withStyle:(UITableViewCellStyle)style;

@end
