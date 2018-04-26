//
//  EditProductViewController.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/24/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface EditProductViewController : UIViewController
@property int productId;
@property int companyId;
@property (nonatomic, retain) Product *selectedProduct;

@end
