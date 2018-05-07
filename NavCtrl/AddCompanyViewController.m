//
//  AddCompanyViewController.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/16/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "AddCompanyViewController.h"

@interface AddCompanyViewController ()

@property (retain, nonatomic) IBOutlet UITextField *companyNameData;

@property (retain, nonatomic) IBOutlet UITextField *companyStockSymbolData;

@property (retain, nonatomic) IBOutlet UITextField *companyURLData;




@end

@implementation AddCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
	[navbar setBackgroundColor: [UIColor greenColor]];
	self.navigationItem.title = @"New Company";
	[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
	
	[self.view addSubview:navbar];
	
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveCompanyData:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(cancel:)];
	self.navigationItem.leftBarButtonItem = cancelButton;
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	
	
	
	
    // Do any additional setup after loading the view from its nib.
}

- (void) saveCompanyData: (id) sender {
	// SAVE COMPANY DATA CODE HERE!
	
	Company *tempComp = [[Company alloc] initWithCompanyName:self.companyNameData.text andWithCompanyStockSymbol: self.companyStockSymbolData.text andWithCompanyImageName: self.companyURLData.text];
	

	
	[[DataAccessObject sharedDAO] addCompany:tempComp];
	
	
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
	[_companyNameData release];
	[_companyStockSymbolData release];
	[_companyURLData release];
	[super dealloc];
}
@end
