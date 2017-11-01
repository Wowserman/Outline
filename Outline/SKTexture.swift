//
//  SKTexture.swift
//  Outline
//
//  Created by Peter on 12/21/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

extension SKTexture {
    convenience init(size: CGSize, topColor: UIColor, bottomColor: UIColor) {
        
        let context = CIContext(options: nil)
        let filter   = CIFilter(name: "CILinearGradient")
        let startVector = CIVector(x: size.width/2, y: size.height)
        let endVector = CIVector(x: size.width/2, y: 0)
        
        let _topColor = CIColor(red: topColor.getRed(), green: topColor.getGreen(), blue: topColor.getBlue(), alpha: topColor.getAlpha())
        
        let _bottomColor = CIColor(red: bottomColor.getRed(), green: bottomColor.getGreen(), blue: bottomColor.getBlue(), alpha: bottomColor.getAlpha())
        
        filter?.setDefaults()
        
        filter?.setValue(startVector, forKey: "inputPoint0")
        filter?.setValue(endVector, forKey: "inputPoint1")
        filter?.setValue(_topColor, forKey: "inputColor0")
        filter?.setValue(_bottomColor, forKey: "inputColor1")
        
        let cgimg = context.createCGImage(
            filter!.outputImage!,
            from: CGRect(x: 0, y: 0, width: size.width, height: size.height)
        )
        
        self.init(cgImage:cgimg!)
    }
    
}
