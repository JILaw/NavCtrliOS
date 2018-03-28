//
//  CompanyVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "CompanyVC.h"

@interface CompanyVC ()

@end

@implementation CompanyVC




- (void)viewDidLoad {
    [super viewDidLoad];
	

	// Do any additional setup after loading the view from its nib.

	self.companyImagesArray = [[NSMutableArray alloc] initWithObjects: @"img-companyLogo_Apple.png",@"img-companyLogo_Google.png", @"img-companyLogo_Tesla", @"img-companyLogo_Twitter.png", nil];

    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.rightBarButtonItem = editButton;
	
	self.companyList = [[NSMutableArray alloc] initWithObjects: @"Apple mobile devices", @"Google mobile devices", @"Tesla mobile devices", @"Twitter mobile devices", nil];
	
	
	self.title = @"Mobile device makers";
	
	self.productViewController = [[ProductVC alloc]init];
	
}

- (void)toggleEditMode {
    
    if (self.tableView.editing) {
        [self.tableView setEditing:NO animated:YES];
        self.navigationItem.rightBarButtonItem.title = @"Edit";
    } else {
        [self.tableView setEditing:YES animated:NO];
        self.navigationItem.rightBarButtonItem.title = @"Done";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.companyList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    cell.textLabel.text = [self.companyList objectAtIndex:[indexPath row]];
	
	
	
	NSString *companyImageStringName = [self.companyImagesArray objectAtIndex: [indexPath row]];
	
	cell.imageView.image = [UIImage imageNamed:companyImageStringName];
	
	
    
    return cell;
}



// Code here to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
	 // Return NO if you do not want the specified item to be editable.
	 return YES;
 }



 // Code here to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
	 if (editingStyle == UITableViewCellEditingStyleDelete) {
	 
		// Data Deletion
		// Delete the row from the data source, from the rows of company and images arrays (to avoid crash)
		[_companyList removeObjectAtIndex: indexPath.row];
		[_companyImagesArray removeObjectAtIndex: indexPath.row];

		// UI Deletion
		 [tableView deleteRowsAtIndexPaths: [NSMutableArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationFade];
	 
		 //[tableView reloadData];
	 }
	 else if (editingStyle == UITableViewCellEditingStyleInsert) {
		 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view  ????
	 }
 }





 


 // Code here to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
	 return YES;
 }

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
	
	NSLog(@"from %ld, to %ld", fromIndexPath.row, toIndexPath.row);
	
	// Data Move is done below
	
	// keep the object at fromindex to a temp variable
	NSString *objectToBeMoved = [self.companyList objectAtIndex:[fromIndexPath row]];
	NSString *imageToBeMoved = [self.companyImagesArray objectAtIndex: [fromIndexPath row]];
	
	
	
	// remove the object(s) from from index
	//[self.companyList removeObject:objectToBeMoved];
	[_companyList removeObjectAtIndex: fromIndexPath.row];
	//[_companyImagesArray removeObjectAtIndex: fromIndexPath.row];
	[self.companyImagesArray removeObject:imageToBeMoved];
	
	// add the object back from temp to toindex
	[self.companyList insertObject:objectToBeMoved atIndex:[toIndexPath row]];
	[self.companyImagesArray insertObject:imageToBeMoved atIndex:[toIndexPath row]];

	// UI Move is done by tableview internal code magic
	
	
	[self.tableView reloadData];
	
	
}



#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//     if (indexPath.row == 0) {
//        self.productViewController.title = @"Apple mobile devices";
//    } else if (indexPath.row == 1) {
//        self.productViewController.title = @"Google mobile devices";
//	} else if (indexPath.row == 2)  {
//		self.productViewController.title = @"Tesla mobile devices";
//	} else {
//		self.productViewController.title = @"Twitter mobile devices";
//	}
//
	
	self.productViewController.title = self.companyList[indexPath.row];
    [self.navigationController
     pushViewController:self.productViewController
     animated:YES];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
@end
