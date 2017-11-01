//
//  DarkSlideTransition.swift
//  Outline
//
//  Created by Peter on 12/26/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func darkSlideTransition(fromScene: SKScene, toScene: SKScene) {
    let shade = SKSpriteNode()
    shade.texture = SKTexture(image: UIImage(size: fromScene.size, fillColor: .black))
    shade.anchorPoint = CGPoint(x: 0, y: 0)
    shade.position = CGPoint(x: fromScene.frame.maxX, y: fromScene.frame.minY)
    shade.zPosition = 10000
    fromScene.addChild(shade)
    shade.run(SKAction.rotate(byAngle: -CGFloat(M_PI), duration: 0.5))
    fromScene.run(
        SKAction.sequence([
            SKAction.wait(forDuration: 0.5),
            SKAction.run {
                fromScene.view?.presentScene(toScene)
            }
        ])
    )
}
