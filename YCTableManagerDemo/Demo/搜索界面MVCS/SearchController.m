//
//  SearchController.m
//  Demo
//
//  Created by 蔡亚超 on 2018/12/21.
//  Copyright © 2018 WellsCai. All rights reserved.
//

#import "SearchController.h"

@interface SearchController()<UISearchBarDelegate>

@end

@implementation SearchController

#pragma mark UISearchBarDelegate
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if ([self.delegate respondsToSelector:@selector(searchTextDidChange:)]) {
        [self.delegate searchTextDidChange:searchText];
    }
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
    //    搜索
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
}

-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [self.searchBar resignFirstResponder];
}


- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] init];
        _searchBar.barStyle = UISearchBarStyleDefault;
        _searchBar.delegate = self;
    }
    return _searchBar;
}

@end
