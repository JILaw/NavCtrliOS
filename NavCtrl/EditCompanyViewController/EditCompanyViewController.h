//
//  EditCompanyViewController.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 4/24/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"

@interface EditCompanyViewController : UIViewController

@property int companyId;

@property (retain, nonatomic) Company *selectedCompany;

@end
