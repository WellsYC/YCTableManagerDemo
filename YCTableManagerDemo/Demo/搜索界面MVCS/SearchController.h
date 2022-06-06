//
//  SearchController.h
//  Demo
//
//  Created by 蔡亚超 on 2018/12/21.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchControllerDelegate <NSObject>

- (void)searchTextDidChange:(NSString *)searchText;
@end

@interface SearchController : NSObject
@property(nonatomic,strong)UISearchBar      *searchBar;
@property(nonatomic,weak)id<SearchControllerDelegate>  delegate;

@end
