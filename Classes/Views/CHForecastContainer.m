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

#import "CHForecastContainer.h"
#import "CHForecastSection.h"

@interface CHForecastContainer ()
@property (nonatomic, strong) CHForecastSection *forecastDayOne;
@property (nonatomic, strong) CHForecastSection *forecastDayTwo;
@property (nonatomic, strong) CHForecastSection *forecastDayThree;
@property (nonatomic, strong) CHForecastSection *forecastDayFour;
@property (nonatomic, strong) CHForecastSection *forecastDayFive;
@property (nonatomic, strong) CHForecastSection *forecastDaySix;
@end

@implementation CHForecastContainer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _forecastDayOne = [[CHForecastSection alloc] init];
        _forecastDayOne.translatesAutoresizingMaskIntoConstraints = NO;
        _forecastDayOne.dayOfTheWeek.text = @"Saturday";
        [self addSubview:_forecastDayOne];
        
        _forecastDayTwo = [[CHForecastSection alloc] init];
        _forecastDayTwo.translatesAutoresizingMaskIntoConstraints = NO;
        _forecastDayTwo.dayOfTheWeek.text = @"Sunday";
        [self addSubview:_forecastDayTwo];
        
        _forecastDayThree = [[CHForecastSection alloc] init];
        _forecastDayThree.translatesAutoresizingMaskIntoConstraints = NO;
        _forecastDayThree.dayOfTheWeek.text = @"Monday";
        [self addSubview:_forecastDayThree];
        
        _forecastDayFour = [[CHForecastSection alloc] init];
        _forecastDayFour.translatesAutoresizingMaskIntoConstraints = NO;
        _forecastDayFour.dayOfTheWeek.text = @"Tuesday";
        [self addSubview:_forecastDayFour];
        
        _forecastDayFive = [[CHForecastSection alloc] init];
        _forecastDayFive.translatesAutoresizingMaskIntoConstraints = NO;
        _forecastDayFive.dayOfTheWeek.text = @"Wednesday";
        [self addSubview:_forecastDayFive];
        
        _forecastDaySix = [[CHForecastSection alloc] init];
        _forecastDaySix.translatesAutoresizingMaskIntoConstraints = NO;
        _forecastDaySix.dayOfTheWeek.text = @"Thursday";
        [self addSubview:_forecastDaySix];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)updateConstraints
{
    NSDictionary *currentWXView = NSDictionaryOfVariableBindings(_forecastDayOne, _forecastDayTwo,
                                                                 _forecastDayThree, _forecastDayFour,
                                                                 _forecastDayFive, _forecastDaySix);
    
    if (([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) ||
        ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight)) {
        
        if (self.constraints) {
            [self removeConstraints:self.constraints];
        }
        
        NSDictionary *metrics = @{@"hSpacing":@10, @"vSpacing":@30, @"header":@30, @"footer":@10};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|H-hSpacing-[_forecastDayOne(>=220)]"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_forecastDayTwo(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDayThree(==_forecastDayOne)]"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_forecastDayFour(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDayFive(==_forecastDayOne)]"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[_forecastDaySix(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-header-[_forecastDayOne(55)]-vSpacing-[_forecastDayThree(==_forecastDayOne)]-vSpacing-[_forecastDayFive(==_forecastDayOne)]"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-header-[_forecastDayTwo(==_forecastDayOne)]-vSpacing-[_forecastDayFour(==_forecastDayOne)]-vSpacing-[_forecastDaySix(==_forecastDayOne)]"
                                                                     options:0
                                                                     metrics:metrics
                                                                       views:currentWXView]];
    } else {
        [self removeConstraints:self.constraints];
        
        NSDictionary *portraitMetrics = @{@"hSpacing":@"14@100",
                                          @"vSpacing":@20,
                                          @"header":@30,
                                          @"footer":@10,
                                          @"forecastWidth":@300,
                                          @"forecastHeight":@55};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDayOne(>=200@1000)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:portraitMetrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDayTwo(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:portraitMetrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDayThree(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:portraitMetrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDayFour(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:portraitMetrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDayFive(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:portraitMetrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-hSpacing-[_forecastDaySix(==_forecastDayOne)]-hSpacing-|"
                                                                     options:0
                                                                     metrics:portraitMetrics
                                                                       views:currentWXView]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-header-[_forecastDayOne(>=55)]-(hSpacing)-[_forecastDayTwo(==_forecastDayOne)]-(hSpacing)-[_forecastDayThree(==_forecastDayOne)]-(hSpacing)-[_forecastDayFour(==_forecastDayOne)]-(hSpacing)-[_forecastDayFive(==_forecastDayOne)]-(hSpacing)-[_forecastDaySix(==_forecastDayOne)]"
                                                                     options:0
                                                                     metrics:portraitMetrics
                                                                       views:currentWXView]];
    }
    
    [super updateConstraints];
}

@end
