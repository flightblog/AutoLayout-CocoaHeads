//
//  CocoaHeads Auto Layout
//
//  Copyright © 2012 Steve Foster <foster@flightblog.org>
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the “Software”),
//  to deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "CHRootViewController.h"
#import "CHCurrentContainer.h"
#import "CHForecastContainer.h"

@interface CHRootViewController ()
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) CHCurrentContainer *currentContianer;
@property (nonatomic, strong) CHForecastContainer *forecastContainer;
@end

@implementation CHRootViewController {
}

#pragma mark - Properties

- (UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _scrollView.autoresizesSubviews = YES;
        _scrollView.scrollEnabled = YES;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2);
        _scrollView.backgroundColor = [UIColor colorWithRed:86/255.0f green:120/255.0f blue:197/255.0f alpha:1.0f];
        _scrollView.delegate = self;
        _scrollView.layer.cornerRadius = 7.0;
        _scrollView.contentOffset = CGPointZero;
    }
    return _scrollView;
}

- (CHCurrentContainer *)currentContianer
{
    if (!_currentContianer) {
        _currentContianer = [[CHCurrentContainer alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _currentContianer.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _currentContianer;
}

- (CHForecastContainer *)forecastContainer
{
    if (!_forecastContainer) {
        _forecastContainer = [[CHForecastContainer alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height)];
        _forecastContainer.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _forecastContainer;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.scrollView];
    [_scrollView setBackgroundColor:[UIColor colorWithRed:86/255.0f green:120/255.0f blue:197/255.0f alpha:1.0f]];
    
    [self.scrollView addSubview:self.currentContianer];
    [self.scrollView addSubview:self.forecastContainer];
}


@end
