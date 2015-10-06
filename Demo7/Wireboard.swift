//
//  Wireboard.swift
//  Demo7
//
//  Created by verec on 06/10/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation

class Wireboard: NSObject {

    func rewire() {

        let parts = Instances.Parts.self

        parts.funnySlider.dragged = {
            let color = UIColor(hue: $0, saturation: 1.0, brightness: 1.0, alpha: 1.0)
            parts.label2.textColor = color
        }
    }
}