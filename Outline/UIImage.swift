//
//  UIImage.swift
//  Outline
//
//  Created by Peter on 12/21/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    
    convenience init(size: CGSize, fillColor: UIColor) {
        let rect: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        fillColor.setFill()
        UIRectFill(rect)
        self.init(cgImage: UIGraphicsGetImageFromCurrentImageContext()!.cgImage!)
    }
    
    func roundedEdgeCrop(cornerRadius: CGFloat) -> UIImage {
        let rect: CGRect = CGRect(origin: CGPoint(x: 0, y: 0), size: size)
        var image = self
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
        image.draw(in: rect)
        image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    func addImageOnTop(topImage: UIImage) -> UIImage {
        let bottomImage = self
        let topImage = topImage
        
        UIGraphicsBeginImageContext(self.size)
        
        let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        bottomImage.draw(in: areaSize)
        
        topImage.draw(in: CGRect(x: size.width/2-(size.height-size.height/5)/2, y: size.height/2-(size.height-size.height/5)/2, width: size.height-size.height/5, height: size.height-size.height/5), blendMode: CGBlendMode.normal, alpha: 1)
        
        let finalImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return finalImage
    }
    
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
        
        self.init(cgImage: cgimg!)
    }
}
