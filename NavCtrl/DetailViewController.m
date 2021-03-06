//
//  DetailViewController.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/22/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "DetailViewController.h"
#import "DataAccessObject.h"


@interface DetailViewController () <WKNavigationDelegate,WKUIDelegate>


@end

@implementation DetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.editProductViewController = [[EditProductViewController alloc]init];
	
	
	UINavigationBar *navbar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
	[navbar setBackgroundColor: [UIColor greenColor]];
	self.navigationItem.title = @"Product Link";
	[self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil]];
	
	[self.view addSubview:navbar];
	
	UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithTitle:@"Edit" style:UIBarButtonItemStylePlain target:self action:@selector(launchEditPage:)];
	self.navigationItem.rightBarButtonItem = editButton;
	self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
	
	
	UIImage *backButtonImage = [[UIImage imageNamed:@"btn-navBack"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
	self.navigationItem.leftBarButtonItem = backButton;
	self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];

	
	
	NSURL *url = [NSURL URLWithString: self.productURL];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	_webView = [[WKWebView alloc]init] ;
	_webView.UIDelegate = self;
	_webView.navigationDelegate = self;
	[_webView loadRequest:request];
	_webView.frame = CGRectMake(self.view.frame.origin.x,85, self.view.frame.size.width, self.view.frame.size.height-85);
	
	[self.view addSubview:_webView];
    // Do any additional setup after loading the view from its nib.
}


- (void) back: (id) sender {
	[self.navigationController popViewControllerAnimated:YES];
	
}

- (void) launchEditPage: (id) sender {
	self.editProductViewController.selectedProduct = self.selectedProduct;
	self.editProductViewController.productId = self.productId;
	self.editProductViewController.companyId = self.companyId;
	
	[self.navigationController
	 pushViewController: self.editProductViewController
	 animated:YES];
	
	
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

@end
