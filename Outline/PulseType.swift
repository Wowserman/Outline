//
//  PulseType.swift
//  Pulse
//
//  Created by Peter on 11/23/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

enum PulseType: Int {
    case Ring
    case Square
    case Triangle
    case RoundedSquare
    case Star
    case OutlineLogo
    case TwinCitySkyline // ( * Add Any New Enumerations above TwinCitySkyline * )
    
    var drawingTexture: SKTexture {
        switch self {
        case .Ring:
            return SKTexture(imageNamed: "circle-drawing.png")
        case .Square:
            return SKTexture(imageNamed: "square-drawing.png")
        case .Triangle:
            return SKTexture(imageNamed: "triangle-drawing.png")
        case .RoundedSquare:
            return SKTexture(imageNamed: "smoothrect-drawing.png")
        case .Star:
            return SKTexture(imageNamed: "star-drawing.png")
        case .OutlineLogo:
            return SKTexture(imageNamed: "logo-drawing.png")
        case .TwinCitySkyline:
            return SKTexture(imageNamed: "twincityskyline-drawing.png")
        }
    }
    
    var outlineTexture: SKTexture {
        switch self {
        case .Ring:
            return SKTexture(imageNamed: "circle-outline.png")
        case .Square:
            return SKTexture(imageNamed: "square-outline.png")
        case .Triangle:
            return SKTexture(imageNamed: "triangle-outline.png")
        case .RoundedSquare:
            return SKTexture(imageNamed: "smoothrect-outline.png")
        case .Star:
            return SKTexture(imageNamed: "star-outline.png")
        case .OutlineLogo:
            return SKTexture(imageNamed: "logo-outline.png")
        case .TwinCitySkyline:
            return SKTexture(imageNamed: "twincityskyline-outline.png")
        }
    }
    
    var hasSkins: Bool {
        switch self {
        case .Ring:
            return true
        case .Square:
            return true
        default:
            return false
        }
    }
    
    var size: CGSize {
        return drawingTexture.size()
    }
    
    var isRotateable: Bool {
        switch self {
        case .Ring:
            return false
        case .Star:
            return false
        default:
            return true
        }
    }
    
    var isWarpable: Bool {
        switch self {
        case .Square:
            return true
        default:
            return false
        }
    }
    
    
    var rotationType: RotationType {
        switch self {
        case .Triangle:
            return RotationType.quarter
        case .OutlineLogo:
            return RotationType.quarter
        default:
            return RotationType.full
        }
    }
    
    static func random() -> PulseType {
        let maxValue = UInt32(PulseType.TwinCitySkyline.rawValue)
        
        var randomType = self.init(rawValue: Int(arc4random_uniform(maxValue + 1)))!
        
        while randomType.isUnlocked == false {
            randomType = self.init(rawValue: Int(arc4random_uniform(maxValue + 1)))!
        }
        
        return randomType
    }
    
    var isUnlocked: Bool {
        switch self {
        default:
            return storage.bool(forKey: "\(self)")
        }
    }
    
    func unlock() {
        storage.set(true, forKey: "\(self)")
    }
    
}
