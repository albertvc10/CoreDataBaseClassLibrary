#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataPoweredTableViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

@property (nonatomic, strong) NSFetchRequest *fetchRequest;

@end
