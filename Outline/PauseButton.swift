//
//  PauseButton.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func pauseGame(scene: SKScene) {
    // Go through every Child (Node) in the Scene's list of Children.
    for child in scene.children {
        if child.name == "background" {
            continue
        }
        child.run(
            // Have the Node Wait for a period of 0.1-0.5 seconds,
            // Than Scale upwards just a tad,
            // Than Scale to nothing (so its unvisable because its so tiny)
            SKAction.sequence(
                [SKAction.wait(forDuration: Double(arc4random_uniform(5))/10),
                 SKAction.scale(to: 1.25, duration: 0.2),
                 SKAction.scale(to: 0, duration: 0.3),
                 SKAction.run({child.isPaused = true})
                ]
            )
        )
    }
    
    // Wait 1 second for all the nodes to Scale out of view,
    // Than show the Pause Items
    
    scene.run(
        SKAction.sequence(
            [SKAction.wait(forDuration: 1),
             SKAction.run {
                
                // Unhide the scoreboard Label, we don't need to create a new label (waste of memory)
                // We're pretty much doing the same SKAction as we used to hide the nodes on the Scoreboard,
                // Instead of hiding it we're just showing it.
                scoreboard.isPaused = false
                scoreboard.run(
                    // Have the Node Wait for a period of 0.1-0.5 seconds,
                    // Than Scale upwards just a tad,
                    // Than Scale to nothing (so its unvisable because its so tiny)
                    SKAction.sequence(
                        [SKAction.wait(forDuration: Double(arc4random_uniform(5))/10),
                         SKAction.scale(to: 1.25, duration: 0.2),
                         SKAction.scale(to: 1, duration: 0.3)]
                    )
                )
                
                // Now we create a couple of labels (continue, restart, home, help)
                
                let continueButton = SKLabelNode(fontNamed: "comicandy")
                
                continueButton.text = "Continue"
                continueButton.name = "continue"
                continueButton.position = CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*1.5)
                continueButton.fontSize = scene.frame.maxY/6
                continueButton.fontColor = SKColor.white
                
                let restartButton = SKLabelNode(fontNamed: "comicandy")
                
                restartButton.text = "Restart"
                restartButton.name = "restart"
                restartButton.position = CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*2)
                restartButton.fontSize = scene.frame.maxY/6
                restartButton.fontColor = SKColor.white
                
                let homeButton = SKLabelNode(fontNamed: "comicandy")
                
                homeButton.text = "Home"
                homeButton.name = "home"
                homeButton.position = CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*2.5)
                homeButton.fontSize = scene.frame.maxY/6
                homeButton.fontColor = SKColor.white
                
                let helpButton = SKLabelNode(fontNamed: "comicandy")
                
                helpButton.text = "Help"
                helpButton.name = "help"
                helpButton.position = CGPoint(x: scene.frame.midX, y: scene.frame.maxY-scene.frame.maxY/2*3)
                helpButton.fontSize = scene.frame.maxY/6
                helpButton.fontColor = SKColor.white
                
                let buttons = [continueButton, restartButton, homeButton, helpButton]
                
                for button in buttons {
                    
                    scene.addChild(button)
                    
                    button.run(
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
                
                scaleColumnEffect(scene: scene, node1: scoreboard, node2: continueButton, node3: restartButton, node4: homeButton, node5: helpButton)
                
                }]
        )
    )
    
}
