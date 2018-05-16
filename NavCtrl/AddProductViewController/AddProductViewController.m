//
//  AddProductViewController.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/16/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "AddProductViewController.h"

@interface AddProductViewController ()
@property (retain, nonatomic) IBOutlet UITextField *productNameData;

@property (retain, nonatomic) IBOutlet UITextField *productURLData;

@property (retain, nonatomic) IBOutlet UITextField *productImageURLData;




@end

@implementation AddProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
	[navbar setBackgroundColor: [UIColor greenColor]];
	self.navigationItem.title = @"Add Product";
	[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
	
	[self.view addSubview:navbar];
	
	
	UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveProductData:)];
	self.navigationItem.rightBarButtonItem = saveButton;
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	UIImage *backButtonImage = [[UIImage imageNamed:@"btn-navBack"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
	self.navigationItem.leftBarButtonItem = backButton;
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
	
}

- (void) saveProductData: (id) sender {
	
	Product *tempProduct = [[Product alloc] initWithProductName:self.productNameData.text andWithProductImageName:self.productImageURLData.text andWithProductURL:self.productURLData.text];
	
	
	
	
	[[DataAccessObject sharedDAO] addProduct:tempProduct companyId: self.companyId];
	[self.navigationController popViewControllerAnimated:YES];
	

}

- (void) back: (id) sender {
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
	[super dealloc];
}
@end
