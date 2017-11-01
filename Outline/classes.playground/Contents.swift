//: Playground - noun: a place where people can play

import UIKit
import SpriteKit

class Button {
    // Create our Variables, they don't equal anything right (nil) now so we have to initialize them later.
    var text: String
    private var backgroundNode: SKSpriteNode // private because we don't want anyone touching it.
    private var textNode: SKLabelNode // private because we don't want anyone touching it.
    var position: CGPoint // People can touch this, because its not private. (Defaults to Public)
    
    func updateButton() {
        // Our function for update our node's positions and the text.
        self.textNode.text = self.text
        self.textNode.position = self.position
        self.backgroundNode.position = self.position
    }
    
    
    /* 
     
     init(text: String, position: CGPoint, scene: SKScene) 
     
     is called we make a new variable thats a Button Class,
     
     It would look something like this when we make a new Button Class instance:
     
     let myButton = Button(text: "Some basic Text", position(x: ourScene.frame.midX, y: ourScene.frame.midY), scene: ourScene)
     
     
     
     Now back to talking about initializers (aka init())
     
     its like do all of this stuff we need to do to make sure that nothing equals nil,
     
     in this case its making our variables: text, backgroundNode, textNode, and position equal something.
     
     init() is kind of like a function, it can take in arguments (also called parameters), 
     
     in our case we're taking in the arguments:
     
        text: String, position: CGPoint, scene: SKScene.
     
     Than we're just initializing our variables to those arguments that we got from the initializer.
     
     Now all of the variables have been initialized (they equal something now)
     
     so now we can safely do stuff with them (Like add the nodes to the Scenes)
     
     */
    init(text: String, position: CGPoint, scene: SKScene) {
        // We have to initialize our variables
        self.text = text
        self.backgroundNode = SKSpriteNode(imageNamed: "some-background-image.png")
        self.textNode = SKLabelNode(fontNamed: "Futura")
        self.position = position
        
        self.updateButton()
        scene.addChild(backgroundNode)
        scene.addChild(textNode)
    }
}

/*
 
 Now we have a new Class called Button. 
 
 Now I'm going to make a new variable that initializes a new Button Class
 
 */

let myButton = Button(text: "Text", position: CGPoint(x: 0, y: 0), scene: SKScene())

/*
 
 Now go ahead and see what you can get from myButton
 
 */

// (delete this comment) myButton.

/*
 
 Now notice how we can only get 3 stuff from myButton:
 
 myButton.position
 myButton.text
 myButton.updateText()
 
 Even though we have 4 variables and 1 function in our Class,
 
 We're missing (well not missing, more like can't access) 2 variables: backgroundNode, and textNode
 
 But we purpously did that, we didn't want backgroundNode and textNode to be accessable outside of the class constructer by declaring the variable Private!
 
 We made them private because we didn't want anyone changing them.
 
 */
