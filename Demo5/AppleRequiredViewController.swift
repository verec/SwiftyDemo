//
//  AppleRequiredViewController.swift
//  Demo5
//
//  Created by verec on 29/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import UIKit

class AppleRequiredViewController : UIViewController {

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [.All]
    }
}