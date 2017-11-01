//
//  ButtonPressedEvent.swift
//  Outline
//
//  Created by Peter on 12/20/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

// Called everytime a Button is Pressed.

func pressButton(button: Button, scene: SKScene) {
    // Do Stuff
    print(button.name)
    
    if button.name.equalsIgnoreCase(string: "play") {
        if scene.name == "Home" {
            scene.view?.presentScene(
                SKScene(fileNamed: "GamePlay")!,
                transition: SKTransition.push(with: SKTransitionDirection.up, duration: 0.5)
            )
        } else {
            // Probably on the EndGame Scene,
            scene.view?.presentScene(
                SKScene(fileNamed: "GamePlay")!,
                transition: SKTransition.push(with: SKTransitionDirection.down, duration: 0.5)
            )
        }
    }
    
    if button.name.equalsIgnoreCase(string: "shop"){
        scene.view?.presentScene(
            SKScene(fileNamed: "Shop")!,
            transition: SKTransition.push(with: SKTransitionDirection.down, duration: 0.5)
        )
    }
    if button.name.equalsIgnoreCase(string: "help"){
        //scene.view?.presentScene(SKScene(fileNamed: "Help")!)
    }
    
    if button.name.equalsIgnoreCase(string: "pause") {
        pause(scene: scene)
    }
    
    if button.name.equalsIgnoreCase(string: "continue") {
        unpause(scene: scene)
    }
    
    if button.name.equalsIgnoreCase(string: "home") {
        if scene.name == "GamePlay" {
            for button in pauseButtons {
                button.run(action: SKAction.sequence([moveOutRight, SKAction.run { button.kill() }]))
            }
            
            // Clear pauseButtons
            pauseButtons.removeAll()
            
            scene.view?.presentScene(
                SKScene(fileNamed: "Home")!,
                transition: SKTransition.push(with: SKTransitionDirection.down, duration: 0.5)
            )
        } else {
            // Probably on the EndGame Scene
            scene.view?.presentScene(
                SKScene(fileNamed: "Home")!,
                transition: SKTransition.push(with: SKTransitionDirection.down, duration: 0.5)
            )
        }
    }
    
    if button.name.equalsIgnoreCase(string: "mute") {
        mute = !mute
        button.backgroundImage = muteImage
    }
}

