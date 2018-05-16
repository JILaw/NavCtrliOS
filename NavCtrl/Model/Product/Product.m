//
//  Product.m
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import "Product.h"

@implementation Product

-(instancetype) initWithProductName: (NSString*) productName andWithProductImageName: (NSString*) productImageName andWithProductURL: (NSString*) productURL
{
	self = [super init];
	if (self) {
		self.productName = productName;
		self.productImageName = productImageName;
		self.productURL = productURL;
	}
	return self;
}


@end
