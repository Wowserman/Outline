//
//  SKScene.swift
//  Outline
//
//  Created by Peter on 12/19/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

extension SKScene {
 
// REMOVED FROM GAME DUE TO HIGH ENERGY USAGE CAUSED BY HIGH USE OF GRADIENTS FOR THE GRAPHIC PROCESSER.
//
//    func animateBackgroundGradient(topColor: UIColor, bottomColor: UIColor) {
//        var darkening = false
//        var amplifier: CGFloat = 1
//        var change: SKAction {
//            return SKAction.run {
//                if darkening && amplifier > 0.5{
//                    amplifier += -0.005
//                } else if darkening {
//                    darkening = !darkening
//                }
//                
//                if !darkening && amplifier < 1 {
//                    amplifier += 0.005
//                } else if !darkening {
//                    darkening = !darkening
//                }
//                
//                self.setBackgroundGradient(topColor: topColor, bottomColor: bottomColor.darken(byAmplifier: amplifier))
//            }
//        }
//        self.run(SKAction.repeatForever(SKAction.sequence([change, SKAction.wait(forDuration: 0.1)])))
//    }
//    
//    func setBackgroundGradient(topColor: UIColor, bottomColor: UIColor) {
//        childNode(withName: "background")?.removeFromParent()
//        let background = SKSpriteNode(texture: SKTexture(size: self.size, topColor: topColor, bottomColor: bottomColor))
//        background.size = self.size
//        background.name = "background"
//        self.addChild(background)
//    }
    
    func getButtons() -> [Button] {
        var sceneButtons = [Button]()
        for button in Button.getButtons() {
            if button.isChild(ofScene: self) {
                sceneButtons.append(button)
            }
        }
        return sceneButtons
    }
    
    /*
     
     In the Future, Swift Extensions will be able to be overriden,
     until Swift adds this feature, do not include this:
     
     */
    func buttonPressed(button: Button) {
        // Do Stuff
    }
     /**/
    
    
    func allChildrenRun(action: SKAction) {
        for child in self.children {
            if child.name != "background" {
                child.run(action)
            }
        }
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        var location: CGPoint? = nil
        var node: SKNode? = nil
        
        for touch in touches {
            location = touch.location(in: self)
            node = self.atPoint(location!)

            for button in self.getButtons() {
                if button.name == node?.name {
                    button.press()
                    self.run(SKAction.sequence([SKAction.wait(forDuration: 0.25), SKAction.run {pressButton(button: button, scene: self)}]))
                    return
                }
            }
        }
        
        regularTouch(location: location!, node: node!, scene: self)
        
    }
    
}
