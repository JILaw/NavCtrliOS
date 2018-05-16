//
//  EditCompanyViewController.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/24/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "EditCompanyViewController.h"
#import "DataAccessObject.h"

@interface EditCompanyViewController ()

@property (retain, nonatomic) IBOutlet UITextField *companyNameData;

@property (retain, nonatomic) IBOutlet UITextField *companyStockSymbolData;

@property (retain, nonatomic) IBOutlet UITextField *companyImageNameData;



@property (retain, nonatomic) IBOutlet UIButton *deleteCompany;

- (IBAction)deleteCompany:(id)sender;





@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation EditCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	

	
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

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
	[navbar setBackgroundColor: [UIColor greenColor]];
	self.navigationItem.title = @"Edit Company";
	[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
	
	//[self.view addSubview:navbar];
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveCompanyData:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	
	_companyNameData.text =  self.selectedCompany.companyName;
	_companyStockSymbolData.text = self.selectedCompany.companyStockSymbol;
	_companyImageNameData.text = self.selectedCompany.companyImageName;
	
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
	
	CGPoint buttonOrigin = self.deleteCompany.frame.origin;
	buttonOrigin.y = buttonOrigin.y + self.scrollView.frame.origin.y;
	
	CGFloat buttonHeight = self.deleteCompany.frame.size.height;
	
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





- (void) saveCompanyData: (id) sender {
	
	// CODE HERE TO SAVE DATA FROM CHANGES/EDITS
	
	[[DataAccessObject sharedDAO] editCompanyWithCompanyId: self.companyId
										andWithCompanyName: self.companyNameData.text
										andWithStockSymbol: self.companyStockSymbolData.text
									   andCompanyImageName: self.companyImageNameData.text];
	
[self.navigationController popToViewController:self.navigationController.viewControllers[1]  animated:YES];
}

- (void) cancel: (id) sender {
	
	[self.view endEditing:YES];

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
	[_companyNameData release];
	[_companyStockSymbolData release];
	[_companyImageNameData release];
	[_scrollView release];
	[_deleteCompany release];
	[super dealloc];
}
- (IBAction)deleteCompany:(id)sender {
	[[DataAccessObject sharedDAO] deleteCompanyWithCompanyId: self.companyId];
	[self.navigationController popToViewController:self.navigationController.viewControllers[1]  animated:YES];
}

@end
