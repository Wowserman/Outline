//
//  LoadGallery.swift
//  Outline
//
//  Created by Peter on 1/3/17.
//  Copyright © 2017 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

fileprivate var gallerynodes = [SKNode]()

fileprivate var gallerybuttons = [Button]()

let prizeitems: [Prizes] = [.EarthSkin,
                                        .CoinSkin,
                                        .RubixCubeSkin,
                                        .PianoKeysSkin,
                                        .GermanSkin,
                                        .IrelandSkin,
                                        .UnitedStatesSkin,
                                        .FinlandSkin,
                                        .DenmarkSkin,
                                        .NorwaySkin,
                                        .SwedenSkin,
                                        .IslandSkin,
                                        .TwinCitySkyline]

var gallerypoints = [CGFloat]()

func loadGallery(scene: SKScene) {
    
    for node in gallerynodes { node.removeFromParent() }
    
    gallerynodes.removeAll()
    
    for button in gallerybuttons { button.kill() }
    
    gallerybuttons.removeAll()
    
    gallerypoints.removeAll()
    
    for i in 0 ..< prizeitems.count {
        
        let imageNode = SKSpriteNode(
            texture: prizeitems[i]._texture,
            size: CGSize(
                width: scene.frame.maxX,
                height: scene.frame.maxX
            )
        )
        imageNode.position = CGPoint(x: CGFloat(i)*CGFloat(scene.frame.maxX * 1.2), y: 0)
        if prizeitems[i].isUnlocked == false {
            imageNode.color = .black
            imageNode.colorBlendFactor = 0.5
        } else {
            if prizeitems[i].isSkin == false {
                imageNode.color = GameColor.random()
                imageNode.colorBlendFactor = 1
            }
        }
        scene.addChild(imageNode)
        
        let name = SKLabelNode(fontNamed: "Futura")
        name.fontSize = scene.frame.maxY/25
        name.position = imageNode.position.add(x: 0, y: scene.frame.maxX*2/3)
        name.fontColor = .white
        name.text = prizeitems[i].name
        scene.addChild(name)
        
        let locked = SKLabelNode(fontNamed: "Futura")
        locked.fontSize = scene.frame.maxY/20
        locked.position = imageNode.position.add(x: 0, y: -scene.frame.maxX*2/3)
        if prizeitems[i].isUnlocked {
            locked.fontColor = GameColor.Green.colorValue
            locked.text = "Unlocked"
        } else {
            locked.fontColor = GameColor.Red.colorValue
            locked.text = "Locked"
            
            let purchase = Button(size: CGSize(width: scene.frame.maxX*1.5*0.5, height: scene.frame.maxX/3*0.5),
                                  text: "Buy (\(prizeitems[i].cost) Coins)",
                position: locked.position.add(x: 0, y: -scene.frame.maxX/3*0.5),
                backgroundColor: GameColor.Yellow.colorValue,
                parent: scene
            )
            purchase.name = prizeitems[i].name
            
            gallerybuttons.append(purchase)
        }
        scene.addChild(locked)
        
        gallerynodes.append(contentsOf: [imageNode, name, locked])
    }
    
    for node in gallerynodes {
        node.run(SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.1), SKAction.scale(to: 1, duration: 0.1)]))
    }
    
    for button in gallerybuttons {
        button.run(action: SKAction.sequence([SKAction.scale(to: 1.1, duration: 0.1), SKAction.scale(to: 1, duration: 0.1)]))
        
        gallerypoints.append(button.position.x)
    }
    
}
