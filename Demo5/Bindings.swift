//
//  Bindings.swift
//  Demo5
//
//  Created by verec on 29/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import UIKit

class Bindings : NSObject {

    static let mainView     = MainView()
    static let mainWindow   = MainWindow(frame: UIScreen.mainScreen().bounds)
    static let mainController: UIViewController = {
            let vc = AppleRequiredViewController()
            vc.view = mainView
            return vc
        } ()
}