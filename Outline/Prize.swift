//
//  Prize.swift
//  Outline
//
//  Created by Peter on 11/29/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Prize {
    private var node = SKSpriteNode(imageNamed: "mystery.png")
    
    private var changesLeft: Double = 50
    
    private var changePerSecond: Double {
        return 0.5 - changesLeft * 0.02
    }
    
    init(parent: SKNode) {
        parent.addChild(node)
    }
}
