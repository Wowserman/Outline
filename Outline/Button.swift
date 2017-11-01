//
//  Button.swift
//  Outline
//
//  Created by Peter on 12/17/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

fileprivate var buttons = [Button]()

class Button {
    
    /* 
     
     Mutable Variable 'size'
     
     get: returns size
     
     set: sets size and immediatly updates Button's Text.
     
     for: Defined Size for the Button.
     
    */
    
    private var _size: CGSize = CGSize()
    
    var size: CGSize {
        get {
            return self._size
        }
        set {
            self._size = newValue
            updateText()
        }
    }
    
    /*
     
     Mutable Variable 'fontSizes'
     
     get: returns fontSize
     
     set: sets size for each line and immediatly updates Button's Text.
     
     for: Font Name for all of the Labels.
     
     */
    
    private var _fontSize: CGFloat = 0
    
    var fontSize: CGFloat {
        get {
            return self._fontSize
        }
        set {
            self._fontSize = newValue
            updateText()
        }
        
    }
    
    
    /*
     
     Mutable Variable 'name'
     
     get: returns name
     
     set: sets size and immediatly updates Button's Text.
     
     for: Universal Name for all SKNodes created.
     
     */
    
    private var _name: String = ""
    
    var name: String {
        get {
            return self._name
        }
        set {
            self.background.name = newValue
            self.label.name = newValue
            self._name = newValue
            updateText()
        }
    }
    
    /*
     
     Mutable Variable 'fontName'
     
     get: returns fontSize
     
     set: sets size and immediatly updates Button's Text.
     
     for: Font Name for all of the Labels.
     
     */
    
    private var _fontName: String = ""
    
    var fontName: String {
        get {
            return self._fontName
        }
        set {
            self._fontName = newValue
            updateText()
        }
    }
    
    /*
     
     Mutable Variable 'position'
     
     get: returns position
     
     set: sets size and immediatly updates Button's Text.
     
     for: Defined Position for the Button.
     
     */
    
    private var _position: CGPoint = CGPoint()
    
    var position: CGPoint {
        get {
            return self._position
        }
        set {
            self.background.position = newValue
            self.label.position = newValue
            self._position = newValue
            updateText()
        }
    }
    
    /*
     
     Mutable Variable 'text'
     
     get: returns text
     
     set: sets text and immediatly updates Button's Text.
     
     for: Displaying Text for the Button. Use '\n' for a new line.
     
     example: 
        
     
        var myText = "First Line\nSecond Line\n\nThird Line\nMore Lines..."
     
        Button.text = myText
     
     
     */
    
    private var _text: String = ""
    
    var text: String {
        get {
            return self._text
        }
        set {
            self._text = newValue
            updateText()
        }
    }
    
    /*
     
     Mutable Variable 'color'
     
     get: returns color
     
     set: sets color and immediatly updates Button's Background.
     
     for: The Top Color of the Gradient Background.
     
     */
    
    private var _color: UIColor = UIColor()
    
    var color: UIColor {
        get {
            return self._color
        }
        
        set {
            self._color = newValue
            updateBackground()
        }
    }

    
    /*
     
     Mutable Variable 'fontColor'
     
     get: returns fontColor
     
     set: sets fontColor and immediatly updates Button's Text.
     
     for: Displaying a Color of the Button's Text
     
     */
    
    private var _fontColor: UIColor = UIColor()
    
    var fontColor: UIColor {
        get {
            return self._fontColor
        }
        set {
            self._fontColor = newValue
            updateText()
        }
    }
    
    /*
     
     Private Mutable Variable 'labels'
     
     for: Privately Referencing the SKLabelNode's that are for the representing the text of the Button.
     
     */
    
    private var label = SKLabelNode()
    
    /*
     
     Private Constant 'background'
     
     for: Privately Referencing the SKSpriteNode that Shows the Background of the Button.
     
     */
    
    private var background = SKSpriteNode()
    
    /*
     
     Variable 'zPosition'
     
     get: returns count of lines.
     
     */
    
    
    private var _zPosition: CGFloat = 0
    
    var zPosition: CGFloat {
        get {
            return _zPosition
        }
        set {
            _zPosition = newValue
            self.updateBackground()
        }
    }
    
    /*
     
     Method 'updateText()'
     
     for: Updating the Text for the Button.
     
     */
    
    func kill() {
        background.removeFromParent()
        label.removeFromParent()
    }
    
    private func updateText() {
        
        label.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center
        
        label.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center
        
        label.position = CGPoint(x: 0, y: 0)
        
        label.fontSize = fontSize
        
        label.fontColor = fontColor
        
        label.fontName = fontName
        
        label.name = name
        
        label.text = text
        
        label.zPosition = background.zPosition + 1
    }
    
    /*
     
     Method 'run(action: SKAction)'
     
     arguments:
         
         action (SKAction): The SKAction we want the Button to Perform.
     
     for: Having all of the Nodes run SKActions
     
     */
    
    func run(action: SKAction) {
        background.run(action)
        label.run(action)
    }
    
    
    /*
     
     Method 'press()'
     
     for: Animating the Button being pressed.
     
     */
    
    func press() {
        self.run(action:
            SKAction.sequence([
                SKAction.scale(to: 1.1, duration: 0.1),
                SKAction.scale(to: 1, duration: 0.1)
            ])
        )
    }
    
    func isChild(ofScene: SKScene) -> Bool {
        return background.scene == ofScene
    }
    
    static func getButtons() -> [Button] {
        return buttons
    }
    
    private var _backgroundImage: UIImage? = nil
    var backgroundImage: UIImage? {
        get {
            return _backgroundImage
        }
        
        set { 
            _backgroundImage = newValue
            updateBackground()
        }
    }
    
    /*
     
     Method 'updateBackground()'
     
     for: Updating the Background for the Button.
     
     */
    
    private func updateBackground() {
        
        background.position = position
        
        background.size = size
        
        background.name = name
        
        var image = UIImage(size: size, fillColor: color).roundedEdgeCrop(cornerRadius: size.height/2)
        
        if backgroundImage != nil {
            image = image.addImageOnTop(topImage: backgroundImage!)
        }
        
        background.texture = SKTexture(image: image)
        
        background.zPosition = zPosition
    }
    
    init(size: CGSize, fontSize: CGFloat, name: String, fontName: String, position: CGPoint, text: String, color: UIColor, bottomColor: UIColor, fontColor: UIColor, parent: SKNode) {
        
        self.size = size
        
        self.name = name
        
        self.fontName = fontName
        
        self.position = position
        
        self.text = text
        
        self.color = color
        
        self.fontName = fontName
        
        self.fontColor = fontColor
        
        self.background.zPosition = 1
        
        parent.addChild(self.background)
        
        self.background.addChild(label)
        
        self.updateBackground()
        
        self.updateText()
        
        buttons.append(self)
    }
    
    init(size: CGSize, text: String, position: CGPoint, backgroundColor: UIColor, parent: SKNode) {
        
        self.size = size
        
        self.name = text
        
        self.fontName = "Futura"
        
        self.fontColor = UIColor.white
        
        self.fontSize = size.height*0.5
        
        self.position = position
        
        self.text = text
        
        self.color = backgroundColor
        
        self.background.zPosition = 1
        
        parent.addChild(self.background)
        
        self.background.addChild(label)
        
        self.updateBackground()
        
        self.updateText()
        
        buttons.append(self)
    }
    
    init(size: CGSize, name: String, position: CGPoint, backgroundColor: UIColor, backgroundImage: UIImage, parent: SKNode) {
        
        self.size = size
        
        self.name = name
        
        self.fontName = "Futura"
        
        self.fontColor = UIColor.white
        
        self.fontSize = size.height*0.5
        
        self.position = position
        
        self.text = ""
        
        self.color = backgroundColor
        
        self.background.zPosition = 1
        
        parent.addChild(self.background)
        
        self.background.addChild(label)
        
        self.updateBackground()
        
        self.updateText()
        
        self.backgroundImage = backgroundImage
        
        buttons.append(self)
    }
}
