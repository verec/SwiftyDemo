//
//  MainWindow.swift
//  Demo5
//
//  Created by verec on 29/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import UIKit

class MainWindow : UIWindow {

    override func layoutSubviews() {
        super.layoutSubviews()

        if Bindings.mainView.superview == nil {
            self.addSubview(Bindings.mainView)
        }

        let bounds = self.bounds

        if !bounds.isDefined {
            return
        }

        Bindings.mainView.frame = bounds
    }
}