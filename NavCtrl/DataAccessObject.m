//
//  (DAO) Data Access Object.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "DataAccessObject.h"


@implementation DataAccessObject

//self.companyImagesArray = [[NSMutableArray alloc] initWithObjects: @"img-companyLogo_Apple.png",@"img-companyLogo_Google.png", @"img-companyLogo_Tesla", @"img-companyLogo_Twitter.png", nil];



// CREATION OF COMPANIES AND PRODUCTS CODE

// Companies...

-(void) createDemoCompanys {
	
	// Companies...
	Company *apple = [[Company alloc] initWithCompanyName:@"Apple mobile devices" andWithCompanyImageName:@"img-companyLogo_Apple.png"];
	Company *google = [[Company alloc] initWithCompanyName:@"Google mobile devices" andWithCompanyImageName:@"img-companyLogo_Google.png"];
	Company *tesla = [[Company alloc] initWithCompanyName:@"Tesla mobile devices" andWithCompanyImageName:@"img-companyLogo_Tesla"];
	Company *twitter = [[Company alloc] initWithCompanyName:@"Twitter mobile devices" andWithCompanyImageName:@"img-companyLogo_Twitter.png"];

	// Products...
	Product *iPad = [[Product alloc] initWithProductName: @"iPad" andWithProductImageName: @"img-Product-1.png" andWithProductURL: @"https://www.apple.com/ipad-9.7/"];
	Product *iPodTouch = [[Product alloc] initWithProductName: @"iPodTouch" andWithProductImageName: @"img-Product-1.png" andWithProductURL: @"https://www.apple.com/ipod-touch/"];
	Product *iPhone = [[Product alloc] initWithProductName: @"iPhone" andWithProductImageName: @"img-Product-1.png" andWithProductURL: @"https://www.apple.com/iphone/"];

	Product *googleX = [[Product alloc] initWithProductName: @"googleX" andWithProductImageName: @"googlePhone.jpg" andWithProductURL: @"https://www.samsung.com/us/mobile/phones/galaxy-s/samsung-galaxy-s4-verizon-white-frost-16gb-sch-i545zwavzw/"];
	Product *googleY = [[Product alloc] initWithProductName: @"googleY" andWithProductImageName: @"googlePhone.jpg" andWithProductURL:  @"https://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb/"];
	Product *googleZ = [[Product alloc] initWithProductName: @"googleZ" andWithProductImageName: @"googlePhone.jpg" andWithProductURL: @"https://www.apple.com/iphone/"];

	Product *modelS = [[Product alloc] initWithProductName: @"modelS" andWithProductImageName: @"teslaCar.png" andWithProductURL: @"https://www.samsung.com/us/mobile/phones/galaxy-s/samsung-galaxy-s4-verizon-white-frost-16gb-sch-i545zwavzw/"];
	Product *modelX = [[Product alloc] initWithProductName: @"modelX" andWithProductImageName: @"teslaCar.png" andWithProductURL:  @"https://www.samsung.com/us/mobile/phones/galaxy-note/s/_/n-10+11+hv1rp+zq1xb/"];
	Product *roadster = [[Product alloc] initWithProductName: @"roadster" andWithProductImageName: @"teslaCar.png" andWithProductURL: @"https://www.google.com/search?q=galaxy+tab&ie=utf-8&oe=utf-8&client=firefox-b-1-ab"];


	Product *aTwitterProduct = [[Product alloc] initWithProductName: @"aTwitterProduct" andWithProductImageName: @"twitterFeed.png" andWithProductURL: @"https://itunes.apple.com/us/app/twitter/id333903271?mt=8"];
	Product *secondTwitterProduct = [[Product alloc] initWithProductName: @"modelX" andWithProductImageName: @"twitterFeed.png" andWithProductURL:   @"https://www.quora.com/topic/Twitter-API"];
	Product *thirdTwitterProduct = [[Product alloc] initWithProductName: @"roadster" andWithProductImageName: @"twitterFeed.png" andWithProductURL: @"https://www.recode.net/2016/10/30/13467684/twitter-product-ideas-wish-list"];

	apple.products = [[NSMutableArray alloc] init];

	[apple.products addObject: iPad];
	[apple.products addObject: iPodTouch];
	[apple.products addObject: iPhone];

	google.products = [[NSMutableArray alloc] init];
	
	[google.products addObject: googleX];
	[google.products addObject: googleY];
	[google.products addObject: googleZ];

	tesla.products = [[NSMutableArray alloc] init];
	
	[tesla.products addObject: modelS];
	[tesla.products addObject: modelX];
	[tesla.products addObject: roadster];

	twitter.products = [[NSMutableArray alloc] init];
	
	[twitter.products addObject: aTwitterProduct];
	[twitter.products addObject: secondTwitterProduct];
	[twitter.products addObject: thirdTwitterProduct];

	
	_companysList = [[NSMutableArray alloc] init];
	
	[_companysList addObject: apple];
	[_companysList addObject: google];
	[_companysList addObject: tesla];
	[_companysList addObject: twitter];
	
}



@end


