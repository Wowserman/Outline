//
//  Crate.swift
//  Outline
//
//  Created by Peter on 1/2/17.
//  Copyright © 2017 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Crate {
    private var prizenode = SKSpriteNode(imageNamed: "help.png")
    
    private var glow = SKSpriteNode(imageNamed: "glow.png")
    
    private var changesLeft: Double = 25
    
    private var currentPrize: Prizes = Prizes.random()
    
    private var changePerSecond: Double {
        return 0.25 - changesLeft * 0.01
    }
    
    private func change() {
        var actions: SKAction {
            let wait = SKAction.wait(forDuration: changePerSecond)
            let block = SKAction.run {
                self.changesLeft += -1
                self.currentPrize = Prizes.random()
                self.prizenode.texture = self.currentPrize._texture
            }
            return SKAction.sequence([wait, block])
        }
        prizenode.run(actions, completion: {
            if self.changesLeft > 0 {
                // Keep Changing
                self.change()
            } else {
                // End
                self.finish()
            }
        })
    }

    private func finish() {
        print("Ta Dah!")
    }
    
    func startopening() {
        
        self.change()
    }
    
    init(scene: SKScene) {
        prizenode.size = CGSize(width: scene.frame.maxX, height: scene.frame.maxX)
        glow.size = CGSize(width: scene.frame.maxX, height: scene.frame.maxX)
        
        prizenode.zPosition = 1
        glow.zPosition = 0
        
        glow.run(SKAction.repeatForever(
            SKAction.group([
                SKAction.sequence(
                    [SKAction.fadeAlpha(to: 0.8, duration: 0.5),
                     SKAction.fadeAlpha(to: 1, duration: 0.5)]),
                SKAction.rotate(byAngle: CGFloat(M_PI/4), duration: 1)
            ])
        ))
        
        scene.addChild(prizenode)
        scene.addChild(glow)
    }
    
    
}
