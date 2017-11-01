//
//  Help.swift
//  Outline
//
//  Created by Peter on 12/22/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

class Help: SKScene {
    
    func showNextButton() {
        
    }
    
    func showPage1() {
        let line1 = SKLabelNode(fontNamed: "Futura")
        let line2 = SKLabelNode(fontNamed: "Futura")
        let line3 = SKLabelNode(fontNamed: "Futura")
        
        line1.position = CGPoint(x: 0, y: 0)
        line2.position = CGPoint(x: 0, y: -50)
        line3.position = CGPoint(x: 0, y: -100)
        
        line1.name = "page1"
    }
    
    func hidePage1() {
        for child in self.children {
            if child.name == "page1" {
                
            }
        }
    }
    
    func showPage2() {
        let line1 = SKLabelNode(fontNamed: "Futura")
        let line2 = SKLabelNode(fontNamed: "Futura")
        let line3 = SKLabelNode(fontNamed: "Futura")
        
        line1.position = CGPoint(x: 0, y: 0)
        line2.position = CGPoint(x: 0, y: -50)
        line3.position = CGPoint(x: 0, y: -100)
    }
    
    func hidePage2() {
        
    }
    
    func showPage3() {
        let line1 = SKLabelNode(fontNamed: "Futura")
        let line2 = SKLabelNode(fontNamed: "Futura")
        let line3 = SKLabelNode(fontNamed: "Futura")
        
        line1.position = CGPoint(x: 0, y: 0)
        line2.position = CGPoint(x: 0, y: -50)
        line3.position = CGPoint(x: 0, y: -100)
    }
    
    func hidePage3() {
        
    }
    
    
    override func didMove(to view: SKView) {
        showPage1()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hidePage1()
        showPage2()
    }
}
