//
//  DetailViewController.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/22/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <WKNavigationDelegate,WKUIDelegate>


@end

@implementation DetailViewController








- (void)viewDidLoad {
    [super viewDidLoad];
	
//	NSDictionary *productURLSDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
//										   @"https://www.apple.com/ipad-9.7/", @"iPad",
//										   @"https://www.apple.com/ipod-touch/",  @"iPod Touch",
//										   @"https://www.apple.com/iphone/", @"iPhone",
//										   @"https://www.samsung.com/us/mobile/phones/galaxy-s/samsung-galaxy-s4-verizon-white-frost-16gb-sch-i545zwavzw/", @"Galaxy S4",
//										   @"https://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb/",  @"Galaxy Note",
//										   @"https://www.google.com/search?q=galaxy+tab&ie=utf-8&oe=utf-8&client=firefox-b-1-ab",  @"Galaxy Tab",
//										   @"https://www.tesla.com/model-s", @"Model S",
//										   @"https://www.tesla.com/modelx", @"Model X",
//										   @"https://www.tesla.com/roadster", @"Roadster",
//										   @"https://itunes.apple.com/us/app/twitter/id333903271?mt=8",  @"ATwitterProduct",
//										   @"https://www.quora.com/topic/Twitter-API",  @"SecondTwitterProduct",
//										   @"https://www.recode.net/2016/10/30/13467684/twitter-product-ideas-wish-list",  @"ThirdTwitterProduct",
//										   nil];
//
//	self.productURLSDictionary = productURLSDictionary;
	
	//NSString *value = [productURLSDictionary valueForKey:self.productURL];
	
	// NSURL *url = [NSURL URLWithString:self.productURL];
	
//	NSString *stringURL = [productURLSDictionary valueForKey:self.productName];
	
//	NSURL *url = [NSURL URLWithString: stringURL];
	
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
