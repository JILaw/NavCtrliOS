//
//  Company.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Company.h"
#import "ProductVC.h"

@implementation Company

-(instancetype) initWithCompanyName: (NSString*) companyName andWithCompanyStockSymbol: (NSString*) companyStockSymbol andWithCompanyImageName: (NSString*) companyImageName;
{
	self = [super init];
	if (self) {
		self.companyName = companyName;
		self.companyStockSymbol = companyStockSymbol;
		self.companyImageName = companyImageName;

	}
	return self;
}

@end


