//
//  HomeButton.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func exitGame(scene: SKScene) {
    killPauseButtons(scene: scene)
    scene.run(
        SKAction.sequence(
            [SKAction.wait(forDuration: 1),
             SKAction.run({
                killAll(scene: scene)
                let Home = SKScene(fileNamed: "Home")
                Home?.scaleMode = scene.scaleMode
                scene.view?.presentScene(Home)
             })]
        )
    )

}
