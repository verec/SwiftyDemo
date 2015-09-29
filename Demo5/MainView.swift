//
//  MainView.swift
//  Demo5
//
//  Created by verec on 29/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import UIKit

class MainView : UIView {

    class func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textAlignment = .Center
        label.font = UIFont.systemFontOfSize(24.0)
        label.textColor = UIColor.whiteColor()
        return label
    }

    let label1 = MainView.createLabel("Singing in the Rain")
    let label2 = MainView.createLabel("Pouring down the Drain")

    let funnySlider = FunnySlider()

    override func layoutSubviews() {
        super.layoutSubviews()

        if label1.superview == nil {
            self.addSubview(label1)
            self.addSubview(label2)
            self.addSubview(funnySlider)
            self.backgroundColor = UIColor.brownColor()

            funnySlider.valueChangedListener = {
                (unitValue) in
                let color = UIColor(hue: unitValue, saturation: 1.0, brightness: 1.0, alpha: 1.0)
                self.label1.textColor = color
            }
        }

        let bounds = self.bounds

        if !bounds.isDefined {
            return
        }

        let isKindOfWide = self.window!.traitCollection.horizontalSizeClass == .Regular

        let aspect: CGRect.Aspect = isKindOfWide ? .Tall : .Wide
        
        let top = bounds.slice(slice: 0, outOf: 3, aspect: aspect)
        let mid = bounds.slice(slice: 1, outOf: 3, aspect: aspect)
        let bot = bounds.slice(slice: 2, outOf: 3, aspect: aspect)

        label1.sizeToFit()
        label1.frame = label1.bounds.centered(intoRect: top)

        funnySlider.bounds.size = CGSize(width: 200.0, height: 44.0)
        funnySlider.frame = funnySlider.bounds.centered(intoRect: mid)

        label2.sizeToFit()
        label2.frame = label2.bounds.centered(intoRect: bot)

    }
}