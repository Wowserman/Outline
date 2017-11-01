//
//  Colorize.swift
//  Outline
//
//  Created by Peter on 12/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func colorize(node: SKSpriteNode) {
    
    var blend: CGFloat = 0.0
    var increasing = true
    var color = GameColor.random()
    var action: SKAction {
        return SKAction.run {
            if increasing && blend > 0{
                blend += -0.01
            } else if increasing {
                increasing = !increasing
                color = GameColor.random()
            }
                
            if !increasing && blend < 1 {
                blend += 0.01
            } else if !increasing {
                increasing = !increasing
            }
            node.color = color
            node.colorBlendFactor = blend
        }
    }
    
    node.run(
        SKAction.repeatForever(SKAction.sequence([SKAction.wait(forDuration: 0.01), action])),
        withKey: "colorize"
    )
    
}
