//
//  CompanyVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "CompanyVC.h"
#import "Company.h"
#import "Product.h"
#import "DataAccessObject.h"

@interface CompanyVC () {
	DataAccessObject *dao;
}

@end

@implementation CompanyVC




- (void)viewDidLoad {
    [super viewDidLoad];
	

	// Do any additional setup after loading the view from its nib.

	
	
	
	dao = [[DataAccessObject alloc] init];
	[dao createDemoCompanys];
	
	self.companies = [dao companysList];
	
	NSLog(@"YI Company name is %@ and product name %@", self.companies[0].companyName, self.companies[0].products[0].productName);
	NSLog (@"The list of companies is: %@", [dao companysList]);
	
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.rightBarButtonItem = editButton;
	
	//self.companyList = [[NSMutableArray alloc] initWithObjects: @"Apple mobile devices", @"Google mobile devices", @"Tesla mobile devices", @"Twitter mobile devices", nil];
	
	
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
	// first OOP change
    return [self.companies count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	
	
	
	
	
    //cell.textLabel.text = [self.companyList objectAtIndex:[indexPath row]];
	
	// second OOP change
	//cell.textLabel.text = [[self.companies objectAtIndex:[indexPath row]] companyName] ;
	//cell.textLabel.text = self.companies[indexPath.row].companyName;
	
	Company *selectedCompany = self.companies[indexPath.row];
	
	cell.textLabel.text = selectedCompany.companyName;
	
	
	
	
	//NSString *companyImageStringName = [self.companyImagesArray objectAtIndex: [indexPath row]];
	// third OOP change
	NSString *companyImageStringName = selectedCompany.companyImageName;
	
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
	 
	// Company *selectedCompany = self.companies[indexPath.row];
	 
	 if (editingStyle == UITableViewCellEditingStyleDelete) {
	 
		// Data Deletion
		// Delete the row from the data source, from the rows of company and images arrays (to avoid crash)
		[self.companies removeObjectAtIndex: indexPath.row];
		 
		// since this data is no longer stored in an array, but instead is stored on properties of objects ... do we still need to do anything here?
		 
		// **OOP changes below??**
		//[_companyImagesArray removeObjectAtIndex: indexPath.row];

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
	
	//Company *selectedCompany = self.companies[indexPath.row];
	
	NSLog(@"from %ld, to %ld", fromIndexPath.row, toIndexPath.row);
	
	// Data Move is done below
	
	// keep the object at fromindex to a temp variable
	// fourth, fifth OOP change  AGAIN: these are not arrays now so.... ???
	Company *objectToBeMoved = [_companies objectAtIndex:[fromIndexPath row]];
	//NSString *imageToBeMoved = [selectedCompany.companyImageName objectAtIndex: [fromIndexPath row]];
	
	
	
	// remove the object(s) from from index
	//[self.companyList removeObject:objectToBeMoved];
	[self.companies removeObjectAtIndex: fromIndexPath.row];
	//[_companyImagesArray removeObjectAtIndex: fromIndexPath.row];
	//[self.companyImagesArray removeObject:imageToBeMoved];
	
	// add the object back from temp to toindex
	[self.companies insertObject:objectToBeMoved atIndex:[toIndexPath row]];
	//[self.companyImagesArray insertObject:imageToBeMoved atIndex:[toIndexPath row]];

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
	
	self.productViewController.title = self.companies[indexPath.row].companyName;
	
	self.productViewController.products = self.companies[indexPath.row].products;
	
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
