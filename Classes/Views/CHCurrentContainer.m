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

#import "CHCurrentContainer.h"

@implementation CHCurrentContainer

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _temperature = [[UILabel alloc] init];
        _temperature.translatesAutoresizingMaskIntoConstraints = NO;
        _temperature.backgroundColor = [UIColor colorWithWhite:0.400 alpha:1.000];
        _temperature.font = [UIFont fontWithName:@"AvenirNext-UltraLight" size:(95)];
        _temperature.textColor = [UIColor colorWithWhite:0.922 alpha:1.000];
        _temperature.shadowColor = [UIColor colorWithWhite:0.45 alpha:0.2];
        _temperature.shadowOffset = CGSizeMake(1, 2);
        _temperature.text = @"82˚";
        [_temperature sizeToFit];
        [self addSubview:_temperature];

        _skyConditions = [[UILabel alloc] init];
        _skyConditions.translatesAutoresizingMaskIntoConstraints = NO;
        _skyConditions.backgroundColor = [UIColor colorWithRed:0.000 green:1.000 blue:0.000 alpha:0.750];
        _skyConditions.font = [UIFont fontWithName:@"Avenir-Light" size:(30)];
        _skyConditions.textColor = [UIColor colorWithWhite:0.922 alpha:1.000];
        _skyConditions.shadowColor = [UIColor colorWithWhite:0.45 alpha:0.2];
        _skyConditions.shadowOffset = CGSizeMake(1, 2);
        _skyConditions.text = @"Wonderfully Clear";
        [_skyConditions sizeToFit];
        [self addSubview:_skyConditions];

        _location = [[UILabel alloc] init];
        _location.translatesAutoresizingMaskIntoConstraints = NO;
        _location.backgroundColor = [UIColor colorWithRed:0.502 green:0.251 blue:0.000 alpha:1.000];
        _location.font = [UIFont fontWithName:@"Avenir-Light" size:(30)];
        _location.textColor = [UIColor colorWithWhite:0.922 alpha:1.000];
        _location.shadowColor = [UIColor colorWithWhite:0.45 alpha:0.2];
        _location.textAlignment = NSTextAlignmentRight;
        _location.shadowOffset = CGSizeMake(1, 2);
        _location.text = @"Nantucket";
        [_location sizeToFit];
        [self addSubview:_location];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)updateConstraints
{
    ////////////////////////////////////////////////////////////////////////////////////////
    //
    //  constraintWithItem
    //
    ////////////////////////////////////////////////////////////////////////////////////////
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_temperature
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_temperature
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_temperature
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:1.0f
                                                      constant:95.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_skyConditions
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_temperature
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0f
                                                      constant:10.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_skyConditions
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_location
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_location
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0f
                                                      constant:0.0f]];
    
    ////////////////////////////////////////////////////////////////////////////////////////
    //
    //  constraintsWithVisualFormat
    //
    ////////////////////////////////////////////////////////////////////////////////////////
    
    /*
     NSDictionary *currentWXView = NSDictionaryOfVariableBindings(_temperature, _skyConditions, _location);
     
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_temperature]"
     options:0
     metrics:nil
     views:currentWXView]];
     
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_temperature]-|"
     options:0
     metrics:nil
     views:currentWXView]];
     
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_skyConditions]"
     options:0
     metrics:nil
     views:currentWXView]];
     
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_temperature(==95)]-10-[_skyConditions]"
     options:NSLayoutFormatAlignAllLeading
     metrics:nil
     views:currentWXView]];
     
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[_location]-|"
     options:0
     metrics:nil
     views:currentWXView]];
     
     [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_location]-|"
     options:0
     metrics:nil
     views:currentWXView]];
     */
    
    [super updateConstraints];
}

@end


