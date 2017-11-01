//
//  Exhibit.swift
//  Outline
//
//  Created by Peter on 1/1/17.
//  Copyright © 2017 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Exhibit {

    var size: CGSize
    
    var prize: Prizes
    
    var node: SKSpriteNode {
        let node = SKSpriteNode()
        node.addChild(prizeNode)
        node.addChild(label)
        return node
    }
    
    private var prizeNode: SKSpriteNode {
        if prize.isUnlocked {
            let node = SKSpriteNode(texture: prize._texture)
            node.size = self.size
            node.position = CGPoint(x: 0, y: 0)
            return node
        } else {
            let node = SKSpriteNode(texture: prize._texture)
            node.size = self.size
            node.position = CGPoint(x: 0, y: 0)
            node.color = .black
            node.colorBlendFactor = 1
            return node
        }
    }
    
    private var label: SKLabelNode {
        let l = SKLabelNode(fontNamed: "Futura")
        l.text = prize.name
        l.fontSize = size.height/10
        l.position = CGPoint(x: 0, y: size.height)
        return l
    }
    
    init(size: CGSize, prize: Prizes) {
        self.size = size
        self.prize = prize
    }
}
