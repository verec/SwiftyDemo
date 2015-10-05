//
//  HelloSimplicity.swift
//  Demo7
//
//  Created by verec on 04/10/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import UIKit

class HelloSimplicity {

    let message: String

    init(helloMessage: String) {
        message = helloMessage
    }

    private func createTrigger() -> UIButton {
        let btn = UIButton(type: .System)
        btn.setTitle("VC", forState: .Normal)
        btn.addTarget(self, action: Selector("tapped:"), forControlEvents: .TouchUpInside)
        return btn
    }

    private var _privateButton:UIButton? = .None
    var trigger: UIButton {
        if let btn = _privateButton {
            return btn
        }
        _privateButton = createTrigger()
        return _privateButton!
    }

    @objc func tapped(button: UIButton) {
        self.present()
    }

    func present() {
        let activityView = UIActivityViewController.init(activityItems: [message], applicationActivities:nil)

        func completed(s:String?, b:Bool, r:[AnyObject]?, e:NSError?) {
            print("s:\(s), b: \(b), r: \(r), e: \(e)")
        }
        activityView.completionWithItemsHandler = completed
        if let presenter: UIViewController = UIApplication.sharedApplication().keyWindow?.rootViewController {
            presenter.presentViewController(activityView, animated: true) {
                print("done! :-)")
            }
        }
    }
}