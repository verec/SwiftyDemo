//
//  CGRect.swift
//  Demo2
//
//  Created by verec on 28/09/2015.
//  Copyright © 2015 Cantabilabs Ltd. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGRect {

    var isDefined: Bool {
        if self.isEmpty || self.isInfinite || self.isNull {
            return false
        }
        return true
    }
}

extension CGRect {

    func positionned(intoRect r: CGRect, widthUnitRatio wu: CGFloat, heightUnitRatio hu: CGFloat) -> CGRect {

        let size:CGSize        = r.size
        let center:CGPoint     = CGPoint(x: r.minX + size.width * wu
                                    ,    y: r.minY + size.height * hu)
        var rect = self
        rect.origin.x = center.x - (rect.width / 2.0)
        rect.origin.y = center.y - (rect.height / 2.0)

        return rect
    }

    func centered(intoRect r: CGRect) -> CGRect {
        return self.positionned(intoRect: r, widthUnitRatio: 0.5, heightUnitRatio: 0.5)
    }
}

extension CGRect {

    enum Aspect {
        case    Wide
        case    Tall
    }

    func slice(slice slice:Int, outOf:Int, aspect: Aspect) -> CGRect {
        var rect = self
        switch aspect {

            case    .Wide:  rect.size.height /= CGFloat(outOf)
                            rect.origin.y += rect.size.height * CGFloat(slice)

            case    .Tall:  rect.size.width /= CGFloat(outOf)
                            rect.origin.x += rect.size.width * CGFloat(slice)
        }
        return rect
    }
}

