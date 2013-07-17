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

#import "CHForecastSection.h"

@implementation CHForecastSection {
}

#pragma mark - UIView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _dayOfTheWeek = [[UILabel alloc] init];
        _dayOfTheWeek.backgroundColor = [UIColor clearColor];
        _dayOfTheWeek.translatesAutoresizingMaskIntoConstraints = NO;
        _dayOfTheWeek.font = [UIFont fontWithName:@"Avenir-Light" size:(20)];
        _dayOfTheWeek.textColor = [UIColor colorWithWhite:0.922 alpha:1.000];
        _dayOfTheWeek.shadowColor = [UIColor colorWithWhite:0.45 alpha:0.2];
        _dayOfTheWeek.text = @"FRIDAY";
        _dayOfTheWeek.shadowOffset = CGSizeMake(1, 2);
        [self addSubview:_dayOfTheWeek];
       
        _conditionOfTheDay = [[UILabel alloc] init];
        _conditionOfTheDay.translatesAutoresizingMaskIntoConstraints = NO;
        _conditionOfTheDay.backgroundColor = [UIColor clearColor];
        _conditionOfTheDay.font = [UIFont fontWithName:@"Avenir-Light" size:(20)];
        _conditionOfTheDay.textColor = [UIColor colorWithWhite:0.922 alpha:1.000];
        _conditionOfTheDay.shadowColor = [UIColor colorWithWhite:0.45 alpha:0.2];
        _conditionOfTheDay.text = @"Snow";
        _conditionOfTheDay.shadowOffset = CGSizeMake(1, 2);
        [self addSubview:_conditionOfTheDay];
                
        _highTempertureOfTheDay = [[UILabel alloc] init];
        _highTempertureOfTheDay.translatesAutoresizingMaskIntoConstraints = NO;
        _highTempertureOfTheDay.backgroundColor = [UIColor clearColor];
        _highTempertureOfTheDay.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:(55)];
        _highTempertureOfTheDay.textColor = [UIColor colorWithWhite:0.922 alpha:1.000];
        _highTempertureOfTheDay.shadowColor = [UIColor colorWithWhite:0.45 alpha:0.2];
        _highTempertureOfTheDay.text = @"46°";
        _highTempertureOfTheDay.shadowOffset = CGSizeMake(1, 2);
        [self addSubview:_highTempertureOfTheDay];
    }
    return self;
}

#pragma mark - Subviews

- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark - Constraints

- (void)updateConstraints
{
    NSDictionary *currentWXView = NSDictionaryOfVariableBindings(_dayOfTheWeek, _conditionOfTheDay, _highTempertureOfTheDay);
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_dayOfTheWeek]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:currentWXView]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_conditionOfTheDay]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:currentWXView]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_highTempertureOfTheDay(55)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:currentWXView]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_highTempertureOfTheDay]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:currentWXView]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-3-[_dayOfTheWeek(20)]-(<=10)-[_conditionOfTheDay(20)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:currentWXView]];
    [super updateConstraints];
}

@end
