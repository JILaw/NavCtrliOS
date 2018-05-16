//
//  ProductVC.m
//  NavCtrl
//
//  Created by Jesse Sahli on 2/7/17.
//  Copyright © 2017 Aditya Narayan. All rights reserved.
//

#import "ProductVC.h"
#import "DetailViewController.h"
#import "Product.h"
#import "DataAccessObject.h"
#import "AddProductViewController.h"
#import "CompanyVC.h"



@interface ProductVC (){
	
	DataAccessObject *dao;

	IBOutlet UIImageView *productImage;
	
	
	
}

@end

@implementation ProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
	[navbar setBackgroundColor:[UIColor greenColor]];
	
	[self.view addSubview:navbar];
	
//	UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
//	self.navigationItem.rightBarButtonItem = editButton;
//	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	// 'ADD PRODUCT' BUTTON CODE BELOW
	
	UIImage *addProductButtonImage = [[UIImage imageNamed:@"btn-navAdd"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	
	UIBarButtonItem *addProductButton = [[UIBarButtonItem alloc] initWithImage:addProductButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(addProduct:)];
	self.navigationItem.rightBarButtonItem = addProductButton;
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	UIImage *backButtonImage = [[UIImage imageNamed:@"btn-navBack"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
	self.navigationItem.leftBarButtonItem = backButton;
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	
	
	
    // Do any additional setup after loading the view from its nib.
	self.addProductViewController = [[AddProductViewController alloc]init];
	
}

- (void) back: (id) sender {
	[self.navigationController popViewControllerAnimated:YES];
	
}

- (void) addProduct: (id) sender {
	
	self.addProductViewController.companyId = self.companyId;
	
	[self.navigationController
	 pushViewController: self.addProductViewController
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

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
	
	productImage.image = [UIImage imageNamed: self.companyImageName];
	
	[self.tableView reloadData];

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
    return [self.products count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
	Product *selectedProduct = self.products[indexPath.row];
	
	cell.textLabel.text = selectedProduct.productName;
	
	//check if you have image in assets or download from URL (??)
	//if UIImage == UIImage imageNamed: selectedProduct.productImageName {
	// } else { downloding functionality}
	
	cell.imageView.image = [UIImage imageNamed: selectedProduct.productImageName];
	
	return cell;
}


 
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }




 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 
	 
	 
	 // code here to delete the row from the data source
	 // code here to delete the rows from the arrays
	 [_products removeObjectAtIndex: indexPath.row];
	 
	 
//	 [_productsImagesArray removeObjectAtIndex: indexPath.row];
	 

	 [tableView deleteRowsAtIndexPaths: [NSMutableArray arrayWithObject: indexPath] withRowAnimation:UITableViewRowAnimationFade];
	 
	 [tableView reloadData];
 }
	 
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view ??
 }
 }

//  code here to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
	// Return NO if you do not want the item to be re-orderable.
	return YES;
}


 //  code here to rearrange the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
	
	// keep the object at fromindex to a temp variable
	Product *objectToBeMoved = [self.products objectAtIndex:[fromIndexPath row]];
	
	[self.products removeObjectAtIndex: fromIndexPath.row];
	
	
	// add the object back from temp to toindex
	[self.products insertObject:objectToBeMoved atIndex:[toIndexPath row]];
	
	
	
	
	// UI Move is done by tableview internal code magic
	[self.tableView reloadData];
	
	
}
 







 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Navigation logic here:

	 // Create the next view controller.
	 
   
	DetailViewController *detailViewController = [[DetailViewController alloc] init];
	 
// Pass the selected object to the new view controller.
	 
	 detailViewController.productURL = self.products[indexPath.row].productURL;
	 detailViewController.selectedProduct = self.products[indexPath.row];
	 detailViewController.companyId = self.companyId;
	 detailViewController.productId = (int)indexPath.row;
	
 
 // Push the new view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 
 }




- (void)dealloc {
    [_tableView release];
	[productImage release];
	[super dealloc];
}
	@end
	
	
