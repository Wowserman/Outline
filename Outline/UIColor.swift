//
//  UIColor.swift
//  Outline
//
//  Created by Peter on 12/21/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    func darken() -> UIColor {
        return UIColor(red: self.getRed()*0.8, green: self.getGreen()*0.8, blue: self.getBlue()*0.8, alpha: self.getAlpha())
    }
    
    func darken(byAmplifier: CGFloat) -> UIColor {
        return UIColor(red: self.getRed()*byAmplifier, green: self.getGreen()*byAmplifier, blue: self.getBlue()*byAmplifier, alpha: self.getAlpha())
    }
    
    func getRed() -> CGFloat {
        return self.getRGB()[0]
    }
    
    func getGreen() -> CGFloat {
        return self.getRGB()[1]
    }
    
    func getBlue() -> CGFloat {
        return self.getRGB()[2]
    }
    
    func getAlpha() -> CGFloat {
        return self.getRGB()[3]
    }
    
    func getRGB() -> [CGFloat] {
        var _r: CGFloat = 0, _g: CGFloat = 0, _b: CGFloat = 0, _a: CGFloat = 0
        self.getRed(&_r, green: &_g, blue: &_b, alpha: &_a)
        
        return [_r, _g, _b, _a]
    }
}
