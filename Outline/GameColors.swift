//
//  RandomColors.swift
//  Pulse
//
//  Created by Peter on 11/23/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

import Foundation
import SpriteKit

fileprivate let colors = [
    // *** 8 Default Colors ***
    
    UIColor(red: 228/255, green: 071/255, blue: 084/255, alpha: 1), // Red
    UIColor(red: 245/255, green: 125/255, blue: 071/255, alpha: 1), // Orange
    UIColor(red: 247/255, green: 189/255, blue: 081/255, alpha: 1), // Yellow
    UIColor(red: 137/255, green: 189/255, blue: 130/255, alpha: 1), // Green
    UIColor(red: 080/255, green: 165/255, blue: 164/255, alpha: 1), // Cyan
    UIColor(red: 084/255, green: 134/255, blue: 192/255, alpha: 1), // Blue
    UIColor(red: 183/255, green: 126/255, blue: 184/255, alpha: 1), // Purple
    UIColor(red: 154/255, green: 101/255, blue: 084/255, alpha: 1), // Brown
    UIColor(red: 207/255, green: 214/255, blue: 228/255, alpha: 1), // White
    UIColor(red: 179/255, green: 184/255, blue: 195/255, alpha: 1), // Light Gray
    UIColor(red: 082/255, green: 096/255, blue: 107/255, alpha: 1), // Dark Gray
    UIColor(red: 039/255, green: 046/255, blue: 054/255, alpha: 1), // Black
]

enum GameColor: Int {
    case Red
    case Orange
    case Yellow
    case Green
    case Cyan
    case Blue
    case Purple
    case Brown
    case White
    case LightGray
    case DarkGray
    case Black
    
    var colorValue: UIColor {
        switch self {
        case .Red:
            return colors[0]
        case .Orange:
            return colors[1]
        case .Yellow:
            return colors[2]
        case .Green:
            return colors[3]
        case .Cyan:
            return colors[4]
        case .Blue:
            return colors[5]
        case .Purple:
            return colors[6]
        case .Brown:
            return colors[7]
        case .White:
            return colors[8]
        case .LightGray:
            return colors[9]
        case .DarkGray:
            return colors[10]
        case .Black:
            return colors[11]
        }
    }
    
    static func random() -> UIColor {
        let maxValue = UInt32(GameColor.Brown.rawValue)
        
        let randomType = self.init(rawValue: Int(arc4random_uniform(maxValue + 1)))!
        return randomType.colorValue
    }
    
}
