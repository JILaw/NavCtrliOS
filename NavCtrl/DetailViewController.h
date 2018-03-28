//
//  DetailViewController.h
//  NavCtrl
//
//  Created by PK/PQ Computer on 3/22/18.
//  Copyright © 2018 Aditya Narayan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface DetailViewController : UIViewController

@property(strong, nonatomic) NSString *productName;

@property(strong,nonatomic) WKWebView *webView;

@property (strong, nonatomic) NSString *productURL;

@property (nonatomic, retain) NSDictionary<NSString*,NSURL*> *productURLSDictionary;

@end
