//
//  Shop.swift
//  Pulse
//
//  Created by Peter on 11/25/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func spawnCoin(scene: SKScene) {
    let x = -scene.frame.maxX*1.5/2 + CGFloat(arc4random_uniform(UInt32(scene.frame.maxX*1.5)))
    
    let y = -scene.frame.maxX*1.5/2 + CGFloat(arc4random_uniform(UInt32(scene.frame.maxX*1.5)))
    
    let pos = CGPoint(x: x, y: y)
    
    let node = SKSpriteNode(imageNamed: "coin.png")
    
    node.position = pos
    
    node.size = CGSize(width: scene.frame.maxX/10, height: scene.frame.maxX/10)
    
    node.zPosition = 10
    
    scene.addChild(node)
    
    node.run(
        SKAction.sequence(
            [SKAction.fadeOut(withDuration: 0),
             SKAction.scale(to: 0.5, duration: 0),
             SKAction.group(
                [SKAction.fadeIn(withDuration: 0.2),
                 SKAction.scale(to: 1, duration: 0.2),
                 SKAction.moveBy(x: 0, y: 50, duration: 0.5)]
                ),
             
             SKAction.move(to: balance.position, duration: 0.5),
             SKAction.run({
                addCoins(amount: 1)
                updateBalance()
                
                balance.removeAction(forKey: "coin")
                
                balance.run(SKAction.sequence(
                    [SKAction.run({
                        balance.fontSize = scene.frame.maxX/6
                    }),
                     SKAction.wait(forDuration: 0.1),
                     SKAction.run({
                        balance.fontSize = scene.frame.maxX/5
                     }),
                     SKAction.wait(forDuration: 0.2),
                     SKAction.run({
                        balance.fontSize = scene.frame.maxX/6
                     })]
                ), withKey: "coin")
                
                node.removeFromParent()
             })]
        )
    )
}

func spawnPerfect(scene: SKScene) {
    
    let label = SKLabelNode(fontNamed: "Futura")
    
    label.position = currentPulse.position
    
    label.fontSize = scene.frame.maxX/4
    
    label.text = "Perfect!"
    
    label.fontColor = SKColor.white
    
    label.zPosition = 9
    
    scene.addChild(label)
    
    label.run(
        SKAction.sequence(
            [SKAction.fadeOut(withDuration: 0),
             SKAction.scale(to: 0.5, duration: 0),
             SKAction.group(
                [SKAction.fadeIn(withDuration: 0.2),
                 SKAction.scale(to: 1.5, duration: 0.2),
                 SKAction.moveBy(x: 0, y: 50, duration: 0.5)]
                ),
             SKAction.fadeOut(withDuration: 0.5),
             SKAction.run({
                label.removeFromParent()
             })
            ]
        )
    )
}

func spawnFail(scene: SKScene) {
    let label = SKLabelNode(fontNamed: "Futura")
    
    label.position = currentPulse.position
    
    label.fontSize = scene.frame.maxX/4
    
    label.text = "You Lose!"
    
    label.fontColor = GameColor.Red.colorValue
    
    label.zPosition = 9
    
    scene.addChild(label)
    
    label.run(
        SKAction.sequence(
            [SKAction.fadeOut(withDuration: 0),
             SKAction.scale(to: 0.5, duration: 0),
             SKAction.group(
                [SKAction.fadeIn(withDuration: 0.2),
                 SKAction.scale(to: 1.5, duration: 0.2),
                 SKAction.moveBy(x: 0, y: 50, duration: 0.5)]
                ),
             SKAction.fadeOut(withDuration: 0.5),
             SKAction.run({
                label.removeFromParent()
             })
            ]
        )
    )
}
