//
//  EditProductViewController.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/24/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "EditProductViewController.h"
#import "DataAccessObject.h"

@interface EditProductViewController ()

@property (retain, nonatomic) IBOutlet UITextField *productNameData;

@property (retain, nonatomic) IBOutlet UITextField *productURLData;

@property (retain, nonatomic) IBOutlet UITextField *productImageURLData;

- (IBAction)deleteProduct:(id)sender;


@property (retain, nonatomic) IBOutlet UIButton *deleteProduct;


@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;



@end

@implementation EditProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
//	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
//	[navbar setBackgroundColor: [UIColor greenColor]];
//	self.navigationItem.title = @"Edit Product";
//	[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
//
//	[self.view addSubview:navbar];
//
//	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveProductData:)];
//	self.navigationItem.rightBarButtonItem = saveButton;
//	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
//
//
//	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
//	self.navigationItem.leftBarButtonItem = cancelButton;
//	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
//
//
//	// ADD current product data to textfields for editing.  ****??????2
//
//
//	_productNameData.text =  self.selectedProduct.productName;
//	_productURLData.text = self.selectedProduct.productURL;
//	_productImageURLData.text = self.selectedProduct.productImageName;
//
	
	
	
    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
	[navbar setBackgroundColor: [UIColor greenColor]];
	self.navigationItem.title = @"Edit Product";
	[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
	
	[self.view addSubview:navbar];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveProductData:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	
	
	
	
	_productNameData.text =  self.selectedProduct.productName;
	_productURLData.text = self.selectedProduct.productURL;
	_productImageURLData.text = self.selectedProduct.productImageName;
	
	
	[super viewWillAppear:animated];
	
	[self registerForKeyboardNotifications];
	
}

- (void)viewWillDisappear:(BOOL)animated {
	
	
	[self deregisterFromKeyboardNotifications];
	
	[super viewWillDisappear:animated];
	
}

- (void)keyboardWasShown:(NSNotification *)notification {
	
	NSDictionary* info = [notification userInfo];
	
	CGSize keyboardSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
	
	CGPoint buttonOrigin = self.deleteProduct.frame.origin;
	buttonOrigin.y = buttonOrigin.y + self.scrollView.frame.origin.y;
	
	CGFloat buttonHeight = self.deleteProduct.frame.size.height;
	
	CGRect visibleRect = self.view.frame;
	
	visibleRect.size.height -= keyboardSize.height;
	
	if (!CGRectContainsPoint(visibleRect, buttonOrigin)){
		
		//	CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
		CGPoint scrollPoint = CGPointMake(0.0, buttonOrigin.y - visibleRect.size.height + buttonHeight);
		
		[self.scrollView setContentOffset:scrollPoint animated:YES];
		
		CGRect sfrm = self.scrollView.frame;
		sfrm.size.height = visibleRect.size.height - sfrm.origin.y - 5;
		
		self.scrollView.frame = sfrm;
		
	}
	
}

- (void)keyboardWillBeHidden:(NSNotification *)notification {
	
	[self.scrollView setContentOffset:CGPointZero animated:YES];
	
}

- (void)registerForKeyboardNotifications {
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWasShown:)
												 name:UIKeyboardDidShowNotification
											   object:nil];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(keyboardWillBeHidden:)
												 name:UIKeyboardWillHideNotification
											   object:nil];
	
}

- (void)deregisterFromKeyboardNotifications {
	
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardDidHideNotification
												  object:nil];
	
	[[NSNotificationCenter defaultCenter] removeObserver:self
													name:UIKeyboardWillHideNotification
												  object:nil];
	
}

- (void) saveProductData: (id) sender {
	
	// CODE HERE TO SAVE DATA FROM CHANGES/EDITS
	
	[[DataAccessObject sharedDAO] editProductWithId:self.productId andCompanyId:self.companyId product:_productNameData.text andProductURL:_productURLData.text andWithProductImageURL:_productImageURLData.text];
	
	[self.navigationController popToViewController:self.navigationController.viewControllers[1]  animated:YES];
}

- (void) cancel: (id) sender {
	
	[self.navigationController popViewControllerAnimated:YES];
	
	
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
	[_productNameData release];
	[_productURLData release];
	[_productImageURLData release];
	
	[_scrollView release];
	[_deleteProduct release];
	[super dealloc];
}



- (IBAction)deleteProduct:(id)sender {
	[[DataAccessObject sharedDAO] deleteProductWithId:self.productId andCompanyId:self.companyId];
	[self.navigationController popToViewController:self.navigationController.viewControllers[1]  animated:YES];
}
@end
