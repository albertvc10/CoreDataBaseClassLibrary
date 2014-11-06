#import "CoreDataPoweredTableViewController.h"
#import "FetchedResultsControllerHelper.h"

@interface CoreDataPoweredTableViewController ()

@property (nonatomic, strong) FetchedResultsControllerHelper *helper;

@end

@implementation CoreDataPoweredTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.helper = [[FetchedResultsControllerHelper alloc] initWithTableView:self.tableView andBlockToUpdateCells:^(NSIndexPath *indexPath) {
         [self configureCell:[self.tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
          }];
   
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    NSLog(@"RUNNING LOW👀");
}


#pragma mark NSFETCHRESULTCONTROLLER 

- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSAssert(self.fetchRequest != nil, @"Fella, pass me a Fetchrequest to show");
    NSAssert(self.managedObjectContext != nil, @"Bro, you forget to pass me a context!");
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:self.fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    _fetchedResultsController.delegate = self.helper;
    NSError *error;
    if (![_fetchedResultsController performFetch:&error]) {
        abort();
    }
    
    return _fetchedResultsController;
    
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections]count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

    NSAssert(cell != nil, @"BIG ERROR, NO CELL! Wow! such crash! many warnings!");

}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        [self.managedObjectContext save:nil];
        //
        //        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        //        [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
        
        //        NSError *error = nil;
        //        if (![context save:&error]) {
        //
        //            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        //            abort();
        //        }
    }
}



@end
