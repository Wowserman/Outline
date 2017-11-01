//
//  Pulse.swift
//  Pulse
//
//  Created by Peter on 11/20/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Pulse {
    
    private var drawing: SKSpriteNode = SKSpriteNode()
    private var outline: SKSpriteNode = SKSpriteNode()
    private var type: PulseType = PulseType.Ring
    private var actionType: ActionType = ActionType.scale
    private var skin: Skins = Skins.None
    /*
     
     A Pulse is a Collection of 2 SKSpriteNode classes:
     - The Drawing Node
     - The Outline Node
     
     */
    
    private var _position: CGPoint = CGPoint(x: 0, y: 0)
    var position: CGPoint {
        get {
            return _position
        }
        set {
            _position = newValue
            drawing.position = _position
            outline.position = _position
        }
    }
    
    func shrinkToNone() {
        drawing.xScale = 0
        drawing.yScale = 0
        outline.xScale = 0
        outline.yScale = 0
    }
    
    private var isOutlineMatchingRotation: Bool {
        
        if type.rotationType == RotationType.full {
            let bool1 = Int(self.outlineZRotation + CGFloat(2)) % 90 == 0
            let bool2 = Int(self.outlineZRotation + CGFloat(1)) % 90 == 0
            let bool3 = Int(self.outlineZRotation) % 90 == 0
            let bool4 = Int(self.outlineZRotation - CGFloat(1)) % 90 == 0
            let bool5 = Int(self.outlineZRotation - CGFloat(2)) % 90 == 0

            return bool1 || bool2 || bool3 || bool4 || bool5
        }
        
        if type.rotationType == RotationType.half {
            let bool1 = Int(self.outlineZRotation + CGFloat(2)) % 180 == 0
            let bool2 = Int(self.outlineZRotation + CGFloat(1)) % 180 == 0
            let bool3 = Int(self.outlineZRotation) % 180 == 0
            let bool4 = Int(self.outlineZRotation - CGFloat(1)) % 180 == 0
            let bool5 = Int(self.outlineZRotation - CGFloat(2)) % 180 == 0
            
            return bool1 || bool2 || bool3 || bool4 || bool5
        }
        
        if type.rotationType == RotationType.quarter {
            let bool1 = Int(self.outlineZRotation + CGFloat(2)) % 360 == 0
            let bool2 = Int(self.outlineZRotation + CGFloat(1)) % 360 == 0
            let bool3 = Int(self.outlineZRotation) % 360 == 0
            let bool4 = Int(self.outlineZRotation - CGFloat(1)) % 360 == 0
            let bool5 = Int(self.outlineZRotation - CGFloat(2)) % 360 == 0
            let bool6 = Int(self.outlineZRotation) == 0
            
            return bool1 || bool2 || bool3 || bool4 || bool5 || bool6
        }
        
        return false
    }
    
    private var isOutlinePerfectlyMatchingRotation: Bool {
        
        if type.rotationType == RotationType.full {
            let bool = Int(self.outlineZRotation) % 90 == 0
            return bool
        }
        
        if type.rotationType == RotationType.half {
            let bool = Int(self.outlineZRotation) % 180 == 0
            
            return bool
        }
        
        if type.rotationType == RotationType.quarter {
            let bool1 = Int(self.outlineZRotation) % 360 == 0
            let bool2 = Int(self.outlineZRotation) == 0
            
            return bool1 || bool2
        }
        
        return false
    }
    
    private var isOutlineMatchingSize: Bool {
        let bool1 = drawing.size.width - outline.size.width >= -15
        let bool2 = drawing.size.width - outline.size.width <= 15
        let bool3 = drawing.size.height - outline.size.height >= -15
        let bool4 = drawing.size.height - outline.size.height <= 15
        
        return bool1 && bool2 && bool3 && bool4
    }
    
    private var isOutlinePerfectlyMatchingSize: Bool {
        let bool1 = drawing.size.width - outline.size.width >= -1
        let bool2 = drawing.size.width - outline.size.width <= 1
        let bool3 = drawing.size.height - outline.size.height >= -1
        let bool4 = drawing.size.height - outline.size.height <= 1
        
        return bool1 && bool2 && bool3 && bool4
    }
    
    private var isOutlineMatchingPosition: Bool {
        let bool1 = drawing.position.x - 15 <= outline.position.x && drawing.position.x + 15 >= outline.position.x
        let bool2 = drawing.position.y - 15 <= outline.position.y && drawing.position.y + 15 >= outline.position.y
        return bool1 && bool2
    }
    
    private var isOutlinePerfectlyMatchingPosition: Bool {
        let bool1 = drawing.position.x - 1 <= outline.position.x && drawing.position.x + 1 >= outline.position.x
        let bool2 = drawing.position.y - 1 <= outline.position.y && drawing.position.y + 1 >= outline.position.y
        return bool1 && bool2
    }
    
    var isDrawingOutlined: Bool {
        if isOutlineMatchingSize && isOutlineMatchingRotation && isOutlineMatchingPosition {
            return true
        } else {
            return false
        }
    }
    
    var isDrawingPerfectlyOutlined: Bool {
        if isOutlinePerfectlyMatchingSize && isOutlinePerfectlyMatchingRotation && isOutlinePerfectlyMatchingPosition {
            return true
        } else {
            return false
        }
    }
    
    func startAnimations() {
        if outline.action(forKey: "animation")==nil {
            print("Starting Animation with Drawing Position of: ",drawing.position, " and Outline Position of:", outline.position)
            outline.run(SKAction.repeatForever(actionType.action), withKey: "animation")
        }
    }
    
    func stopAnimations() {
        outline.removeAllActions()
        drawing.removeAllActions()
        print("Stopping Animation with Drawing Position of: ",drawing.position, " and Outline Position of:", outline.position)
        // reset outline and drawing
        drawing.xScale = 1
        drawing.yScale = 1
        drawing.alpha = 1
        drawing.position = position
        outline.xScale = 1
        outline.yScale = 1
        outline.alpha = 1
        outline.position = position
        
    }
    
    func setPaused(toValue: Bool) {
        outline.isPaused = toValue
        drawing.isPaused = toValue
    }
    
    func kill() {
        self.outline.removeFromParent()
        drawing.run(SKAction.sequence(
            [SKAction.group([SKAction.fadeOut(withDuration: 0.2), SKAction.scale(by: 1.5, duration: 0.2)]), SKAction.sequence([SKAction.wait(forDuration: 0.2), SKAction.run({
                    self.drawing.removeFromParent()
                }
            )])]
        ))
    }
    
    private var _drawingSize: CGSize = CGSize()
    
    var drawingSize: CGSize {
        get {
            return _drawingSize
        }
        set {
            _drawingSize = newValue
            drawing.size = drawingSize
        }
    }
    
    private var _outlineSize: CGSize = CGSize()
    
    var outlineSize: CGSize {
        get {
            return _outlineSize
        }
        set {
            _outlineSize = newValue
            outline.size = outlineSize
        }
    }
    
    var outlineZRotation: CGFloat {
        return CGFloat((180/M_PI) * Double(outline.zRotation))
    }
    
    func resetZPosition() {
        drawing.zRotation = 0
        outline.zRotation = 0
    }
    
    func colorize() {
        drawing.color = GameColor.random()
        drawing.colorBlendFactor = 1
    }
    
    func changeSkin() {
        let selectedSkin = Skins.getRandomSkinFor(PulseType: self.type)
        if selectedSkin == Skins.None {
            self.colorize()
            return
        } else {
            drawing.texture = selectedSkin.texture
            self.skin = selectedSkin
        }
    }
    
    func getSkin() -> Skins {
        return self.skin
    }
    
    init(parent: SKScene, position: CGPoint, type: PulseType, actionType: ActionType) {
        self.position = position
        parent.addChild(drawing)
        parent.addChild(outline)
        self.position = position
        print("Initializing Pulse with Drawing Position of: ",drawing.position, " and Outline Position of:", outline.position, "\nWith the global position of: ", self.position)
        self.type = type
        drawing.texture = self.type.drawingTexture
        outline.texture = self.type.outlineTexture
        drawing.size = self.type.size
        outline.size = self.type.size
        if arc4random_uniform(2) > 0 {
            /* 2/3 Chance */
            self.changeSkin()
        } else {
            self.colorize()
        }
        drawing.zPosition = 1
        outline.zPosition = 1.5
        drawing.size = CGSize(width: parent.frame.maxX, height: parent.frame.maxX)
        outline.size = CGSize(width: parent.frame.maxX, height: parent.frame.maxX)
        self.actionType = actionType
        currentPulse = self
        self.startAnimations()
    }
    
    init() {
        return
    }
}
