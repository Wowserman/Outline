//
//  EndGameEvent.swift
//  Outline
//
//  Created by Peter on 12/30/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func endGame(scene: SKScene) {
    spawnFail(scene: scene)
    scene.run(SKAction.sequence([SKAction.wait(forDuration: 0.5), SKAction.run {
        scene.view?.presentScene(
            SKScene(fileNamed: "EndGame")!,
            transition: SKTransition.push(with: SKTransitionDirection.up, duration: 0.5)
        )
    }]))
    
}
