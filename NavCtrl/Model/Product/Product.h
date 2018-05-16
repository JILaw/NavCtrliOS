//
//  Product.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/28/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property (nonatomic, retain) NSString* productName;
@property (nonatomic, retain) NSString* productImageName;
@property (nonatomic, retain) NSString* productURL;

@property (nonatomic) NSInteger* productId;

-(instancetype) initWithProductName: (NSString*) productName andWithProductImageName: (NSString*) productImageName andWithProductURL: (NSString*) productURL;

@end
