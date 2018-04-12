//
//  Company.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Company.h"

@implementation Company

-(instancetype) initWithCompanyName: (NSString*) companyName andWithCompanyImageName: (NSString*) companyImageName;
{
	self = [super init];
	if (self) {
		self.companyName = companyName;
		self.companyImageName = companyImageName;

	}
	return self;
}

@end


