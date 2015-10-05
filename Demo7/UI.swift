//
//  UI.swift
//  Demo7
//
//  Created by verec on 04/10/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import UIKit

class MainController : UIViewController {

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [.All]
    }
}

extension UIView {

    var orphaned: Bool {
        return self.superview == nil
    }
}

class MainWindow : UIWindow {

    override func layoutSubviews() {
        super.layoutSubviews()

        if Bindings.mainView.orphaned {
            self.addSubview(Bindings.mainView)
        }

        Bindings.mainView.frame = self.bounds
    }
}

class MainView : UIView {

    class func createLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFontOfSize(20.0)
        label.textAlignment = .Center
        return label
    }

    let label1 = MainView.createLabel("Singing in the Rain")
    let label2 = MainView.createLabel("Pouring down the Drain")

    let funnySlider = FunnySlider()

    override func layoutSubviews() {
        super.layoutSubviews()

        if label1.orphaned {
            self.backgroundColor = UIColor.whiteColor()

            self.addSubview(label1)
            self.addSubview(label2)
            self.addSubview(funnySlider)

            funnySlider.valueChangedListener = {
                let color = UIColor(hue: $0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
                self.label1.textColor = color
                let color2 = UIColor(hue: 1.0 - $0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
                self.label2.textColor = color2
            }

            self.addSubview(Bindings.mainSystemVC.trigger)
        }

        let isKindOfWide = self.window!.traitCollection.horizontalSizeClass == .Regular
        let aspect: CGRect.Aspect = isKindOfWide ? .Tall : .Wide

        let top = self.bounds.slice(slice: 0, outOf: 3, aspect: aspect)
        let mid = self.bounds.slice(slice: 1, outOf: 3, aspect: aspect)
        let bot = self.bounds.slice(slice: 2, outOf: 3, aspect: aspect)
        let botR = bot.slice(slice: 3, outOf: 4, aspect: .Tall)
        let botL = bot.difference(botR)

        label1.sizeToFit()
        label1.frame = label1.bounds.centered(intoRect: top)

        funnySlider.bounds.size = CGSize(width: 200.0, height: 44.0)
        funnySlider.frame = funnySlider.bounds.centered(intoRect: mid)

        label2.sizeToFit()
        label2.frame = label2.bounds.centered(intoRect: botL)

        Bindings.mainSystemVC.trigger.bounds.size = CGSize(width: 70.0, height: 44.0)
        Bindings.mainSystemVC.trigger.frame = Bindings.mainSystemVC.trigger.bounds.centered(intoRect: botR)
    }
}