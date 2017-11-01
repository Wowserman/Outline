//
//  Shop.swift
//  Outline
//
//  Created by Peter on 12/4/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Shop: SKScene {
    
    let theCam = SKCameraNode()
    
    var home: Button? = nil
    
    var opencrate: Button? = nil
    
    var gallerypage = 0
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = GameColor.Black.colorValue
    
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft(sender:)))

        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(self.swipeRight(sender:)))
        
        loadGallery(scene: self)
        
        home = Button(
            size: CGSize(width: self.frame.maxX*1.5*0.75, height: self.frame.maxX/3*0.75),
            text: "Home",
            position: CGPoint(x: self.frame.midX, y: self.frame.maxY-self.frame.maxX/6),
            backgroundColor: GameColor.Green.colorValue,
            parent: theCam
        )
        
        view.removeGestureRecognizer(swipeLeft)
        view.removeGestureRecognizer(swipeRight)
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
        self.addChild(theCam)
        self.camera = theCam
    }
    
    func swipeLeft(sender: UISwipeGestureRecognizer) {
        // Forward
        // Check if they are not on the last page, or running Actions
        if gallerypoints.count <= gallerypage || theCam.hasActions() {
            return
        } else {
            // Can go to the next Page.
            gallerypage += 1
            print(gallerypoints, gallerypage)
            self.camera!.run(SKAction.move(to: CGPoint(x: gallerypoints[gallerypage], y: self.camera!.position.y), duration: 0.25))
            print("Swiped Left")
        }
    }
    
    func swipeRight(sender: UISwipeGestureRecognizer) {
        // Back
        
        // Check if they are not on the first page, or running Actions
        if gallerypage == 0 || theCam.hasActions() {
            print("Can't Swipe Right")
            return
        } else {
            // Can go to the next Page.
            gallerypage += -1
            self.camera!.run(SKAction.move(to: CGPoint(x: gallerypoints[gallerypage], y: self.camera!.position.y), duration: 0.25))
            print("Swiped Right")
        }
    }
}
