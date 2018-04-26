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
#import "AddCompanyViewController.h"
#import "EditCompanyViewController.h"

@interface CompanyVC () {
	DataAccessObject *dao;
	EditCompanyViewController *editingVC;
}

@end

@implementation CompanyVC




- (void)viewDidLoad {
    [super viewDidLoad];
	

	// Do any additional setup after loading the view from its nib.

	
	
	
	dao = [DataAccessObject sharedDAO];
	[dao createDemoCompanys];
	
	self.companies = [dao companysList];
	

	
	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
	//[navbar setBackgroundColor: [UIColor greenColor]];
	self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:29.0f/255.0f green:159.0f/255.0f blue:74.0f/255.0f alpha:1.0f];
	
	self.navigationItem.title = @"Mobile Devices";
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
	
	[self.view addSubview:navbar];

	
	
	
	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
    self.navigationItem.leftBarButtonItem = editButton;
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	
	
	
	
	
	// 'ADD COMPANY' BUTTON CODE BELOW
	
	UIImage *addCompanyButtonImage = [[UIImage imageNamed:@"btn-navAdd"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	
	UIBarButtonItem *addCompanybutton = [[UIBarButtonItem alloc] initWithImage:addCompanyButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(addCompany:)];
	self.navigationItem.rightBarButtonItem = addCompanybutton;
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	self.productViewController = [[ProductVC alloc]init];
	
	// Initialize the addCompanyViewController
	self.addCompanyViewController = [[AddCompanyViewController alloc]init];
	
	editingVC = [[EditCompanyViewController alloc] init];
	
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[_tableView reloadData];
	self.companies = [dao companysList];
}

- (void)addCompany: (id) sender  {
	// push to new view controller
	[self.navigationController
	 pushViewController: self.addCompanyViewController
	 animated:YES];
	
	
	
	
	
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
//	return [[dao companysList] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
	
	
	Company *selectedCompany = self.companies[indexPath.row];
	
	cell.textLabel.text = selectedCompany.companyName;
	
	
	
	
	
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
	 
	
	 
	 if (editingStyle == UITableViewCellEditingStyleDelete) {
	 
		// Data Deletion
		// Delete the row from the data source, from the rows of company and images arrays (to avoid crash)
		[self.companies removeObjectAtIndex: indexPath.row];

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
	
	
	Company *objectToBeMoved = [_companies objectAtIndex:[fromIndexPath row]];
	
	
	
	
	// remove the object(s) from from index
	
	[self.companies removeObjectAtIndex: fromIndexPath.row];
	
	
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
	
	if  (self.tableView.editing) {
		editingVC.title = @"Edit Company";
		
//		Company *currentCompany = dao.companysList[indexPath.row];
		
		editingVC.selectedCompany = dao.companysList[indexPath.row];
		editingVC.companyId = (int)indexPath.row;
		
		[self.navigationController
		 pushViewController: editingVC
		 animated:YES];
	} else {
		
		
	
	self.productViewController.title = self.companies[indexPath.row].companyName;
	self.productViewController.products = self.companies[indexPath.row].products;
	self.productViewController.companyImageName = self.companies[indexPath.row].companyImageName;
	
	self.productViewController.companyId = (int)indexPath.row;
	
    [self.navigationController
     pushViewController:self.productViewController
     animated:YES];
    
	}

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
