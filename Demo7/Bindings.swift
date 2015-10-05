//
//  Bindings.swift
//  Demo7
//
//  Created by verec on 04/10/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import UIKit

class Bindings: NSObject {

    static let mainController   =   MainController()
    static let mainView         =   MainView()
    static let mainWindow       =   MainWindow(frame: UIScreen.mainScreen().bounds)
    static let mainSystemVC     =   HelloSimplicity(helloMessage: "Can still do legacy, ill conceived VC stuff, though!")
}