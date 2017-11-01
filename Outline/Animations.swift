//
//  Animations.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func killPauseButtons(scene: SKScene) {
    for child in scene.children {
        if child.name == "continue"
            || child.name == "restart"
            || child.name == "home"
            || child.name == "scoreboard"
            || child.name == "help" {
            child.run(
                // Have the Node Wait for a period of 0.1-0.5 seconds,
                // Than Scale upwards just a tad,
                // Than Scale to nothing (so its unvisable because its so tiny)
                SKAction.sequence(
                    [SKAction.wait(forDuration: Double(arc4random_uniform(5))/10),
                     SKAction.scale(to: 1.25, duration: 0.2),
                     SKAction.scale(to: 0, duration: 0.3),
                     SKAction.run(
                        {
                            if child.name != "scoreboard" {
                                child.removeFromParent()
                            }
                        }
                        )]
                )
            )
        }
    }
}

func killAll(scene: SKScene) {
    for child in scene.children {
        child.removeFromParent()
    }
}

func showGamePlayNodes(scene: SKScene) {
    for child in scene.children {
        if child.name == "background" {
            continue
        }
        child.isPaused = false
        child.run(
            // Have the Node Wait for a period of 0.1-0.5 seconds,
            // Than Scale upwards just a tad,
            // Than Scale to nothing (so its unvisable because its so tiny)
            SKAction.sequence(
                [SKAction.scale(to: 0, duration: 0),
                 SKAction.wait(forDuration: Double(arc4random_uniform(5))/10),
                 SKAction.scale(to: 1.25, duration: 0.2),
                 SKAction.scale(to: 1, duration: 0.3)]
            )
        )
    }
}

func showAllNodes(scene: SKScene) {
    for child in scene.children {
        if child.name == "background" {
            continue
        }
        child.isPaused = false 
        child.run(
            
            // Have the Node Wait for a period of 0.1-0.5 seconds,
            // Than Scale upwards just a tad,
            // Than Scale to nothing (so its unvisable because its so tiny)
            SKAction.sequence(
                [SKAction.scale(to: 0, duration: 0),
                 SKAction.wait(forDuration: Double(arc4random_uniform(5))/10),
                 SKAction.scale(to: 1.25, duration: 0.2),
                 SKAction.scale(to: 1, duration: 0.3)]
            )
        )
    }
}

func scaleColumnEffect(scene: SKScene, node1: SKNode, node2: SKNode, node3: SKNode, node4: SKNode, node5: SKNode) {
    scene.run(SKAction.repeatForever(
        SKAction.sequence([
            SKAction.run({
                node1.run(SKAction.scale(to: 1.25, duration: 0.5))
            }),
            SKAction.wait(forDuration: 0.5),
            SKAction.run({
                node1.run(SKAction.scale(to: 1.0, duration: 0.5))
                node2.run(SKAction.scale(to: 1.25, duration: 0.5))
            }),
            SKAction.wait(forDuration: 0.5),
            SKAction.run({
                node2.run(SKAction.scale(to: 1.0, duration: 0.5))
                node3.run(SKAction.scale(to: 1.25, duration: 0.5))
            }),
            SKAction.wait(forDuration: 0.5),
            SKAction.run({
                node3.run(SKAction.scale(to: 1.0, duration: 0.5))
                node4.run(SKAction.scale(to: 1.25, duration: 0.5))
            }),
            SKAction.wait(forDuration: 0.5),
            SKAction.run({
                node4.run(SKAction.scale(to: 1.0, duration: 0.5))
                node5.run(SKAction.scale(to: 1.25, duration: 0.5))
            }),
            SKAction.wait(forDuration: 0.5),
            SKAction.run({
                node5.run(SKAction.scale(to: 1.0, duration: 0.5))
            }),
            SKAction.wait(forDuration: 12.5)])
        ), withKey: "scalecolumneffect"
    )
}

func stopScaleColumnEffect(scene: SKScene) {
    scene.removeAction(forKey: "scalecolumneffect")
}
