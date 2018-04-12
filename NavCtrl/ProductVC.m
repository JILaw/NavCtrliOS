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



@interface ProductVC (){
	
	DataAccessObject *dao;


}
@end

@implementation ProductVC

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(toggleEditMode)];
	self.navigationItem.rightBarButtonItem = editButton;
    // Do any additional setup after loading the view from its nib.
	
	
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
	
	
	
//    if ([self.title isEqualToString:@"Apple mobile devices"]) {
//		self.products = appleProducts;
//		self.productsImagesArray = appleProductImagesArray;
//    } else if ([self.title isEqualToString:@"Google mobile devices"]) {
//		self.products = googleProducts;
//		self.productsImagesArray = googleProductImagesArray;
//    } else if ([self.title isEqualToString:@"Tesla mobile devices"]) {
//		self.products = teslaProducts;
//		self.productsImagesArray = teslaProductImagesArray;
//	} else if ([self.title isEqualToString:@"Twitter mobile devices"]){
//		self.products = twitterProducts;
//		self.productsImagesArray = twitterProductImagesArray;
//	}
	
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
	cell.imageView.image = [UIImage imageNamed: selectedProduct.productImageName];
	

	
// original non-OOP code below
// NSString *productImageStringName = selectedProduct.productImageName;
//
//	cell.imageView.image = [UIImage imageNamed: productImageStringName];
	
	
	
// cell.textLabel.text = [self.products objectAtIndex:[indexPath row]];
//
//
// cell.imageView.image = [UIImage imageNamed: [self.productsImagesArray objectAtIndex: [indexPath row]]];
	
	

	
	
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
	//	NSString *imageToBeMoved = [self.productsImagesArray objectAtIndex: [fromIndexPath row]];
	
	
	
	// remove the object(s) from from index
	//[self.companyList removeObject:objectToBeMoved];
	[self.products removeObjectAtIndex: fromIndexPath.row];
    //[self.productsImagesArray removeObjectAtIndex: fromIndexPath.row];
	//[self.productsImagesArray removeObject:imageToBeMoved];
	
	// add the object back from temp to toindex
	[self.products insertObject:objectToBeMoved atIndex:[toIndexPath row]];
	//[self.productsImagesArray insertObject:imageToBeMoved atIndex:[toIndexPath row]];
	
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
//	 NSString *selectedProduct = [self.products objectAtIndex: [indexPath row]];
	 
 //    detailViewController.productName = selectedProduct;
	 
	 detailViewController.productURL = self.products[indexPath.row].productURL;
	 
	
 
 // Push the new view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 
 }




- (void)dealloc {
    [_tableView release];
    [super dealloc];
}
	@end
	
	
