//
//  FunnySlider.h
//  Demo2
//
//  Created by verec on 28/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

@import Foundation ;
@import UIKit ;

typedef void (^value_changed_t)(CGFloat) ;

@interface FunnySlider : UIView
@property (nonatomic, assign) CGFloat           unitValue ;
@property (nonatomic, copy) value_changed_t     valueChangedListener ;
@end
