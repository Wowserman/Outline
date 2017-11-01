//
//  CGPoint.swift
//  Outline
//
//  Created by Peter on 12/21/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGPoint {
    func add(x: CGFloat, y: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}
