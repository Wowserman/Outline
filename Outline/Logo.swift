//
//  Logo.swift
//  Outline
//
//  Created by Peter on 12/16/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Logo {
    private var backnode1 = SKSpriteNode(imageNamed: "outline-logo.png")
    
    private var backnode2 = SKSpriteNode(imageNamed: "outline-logo.png")
    
    private var backnode3 = SKSpriteNode(imageNamed: "outline-logo.png")
    
    private var logo = SKSpriteNode(imageNamed: "outline-logo.png")
    
    private var backgroundNodes: [SKSpriteNode]
    
    var nodes = [SKNode]()
    
    init(parent: SKScene, position: CGPoint) {
        
        nodes.append(contentsOf: [backnode1, backnode2, backnode3, logo])
        
        for node in nodes {
            let node = node as! SKSpriteNode
            node.size = CGSize(width: parent.frame.maxX, height: parent.frame.maxX/4)

        }
        
        logo.position = position
        logo.zPosition = 10
        logo.name = "logo"
        logo.color = SKColor.white
        logo.colorBlendFactor = 1
        
        parent.addChild(logo)
        
        backgroundNodes = [backnode1, backnode2, backnode3]
        var vector = CGVector(dx: -10, dy: -10)
        
        var zPos: CGFloat = 6
        
        var usedColors: [UIColor] = []
        
        for node in backgroundNodes {
            node.position = logo.position.add(x: vector.dx, y: vector.dy)
            
            var selectedColor = GameColor.random()
            
            while usedColors.contains(selectedColor) {
                selectedColor = GameColor.random()
            }
            
            usedColors.append(selectedColor)
            
            node.color = selectedColor
            node.colorBlendFactor = 1
            node.zPosition = zPos
            
            parent.addChild(node)
            
            vector = CGVector(dx: vector.dx-10, dy: vector.dy-10)
            
            zPos = zPos + 1
        }
    }
    
    init() {
        backgroundNodes = []
    }
}
