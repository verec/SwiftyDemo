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

        if Instances.mainView.orphaned {
            self.addSubview(Instances.mainView)
        }

        Instances.mainView.frame = self.bounds
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

    override func layoutSubviews() {
        super.layoutSubviews()

        let parts = Instances.Parts.self

        if parts.label1.orphaned {
            self.backgroundColor = UIColor.whiteColor()

            self.addSubview(parts.label1)
            self.addSubview(parts.label2)
            self.addSubview(parts.funnySlider)

            self.addSubview(Instances.mainSystemVC.trigger)
        }

        let isKindOfWide = self.window!.traitCollection.horizontalSizeClass == .Regular
        let aspect: CGRect.Aspect = isKindOfWide ? .Tall : .Wide

        let top = self.bounds.slice(slice: 0, outOf: 3, aspect: aspect)
        let mid = self.bounds.slice(slice: 1, outOf: 3, aspect: aspect)
        let bot = self.bounds.slice(slice: 2, outOf: 3, aspect: aspect)
        let botR = bot.slice(slice: 3, outOf: 4, aspect: .Tall)
        let botL = bot.difference(botR)

        parts.label1.sizeToFit()
        parts.label1.frame = parts.label1.bounds.centered(intoRect: top)

        parts.funnySlider.bounds.size = CGSize(width: 200.0, height: 44.0)
        parts.funnySlider.frame = parts.funnySlider.bounds.centered(intoRect: mid)

        parts.label2.sizeToFit()
        parts.label2.frame = parts.label2.bounds.centered(intoRect: botL)

        Instances.mainSystemVC.trigger.bounds.size = CGSize(width: 70.0, height: 44.0)
        Instances.mainSystemVC.trigger.frame = Instances.mainSystemVC.trigger.bounds.centered(intoRect: botR)
    }
}