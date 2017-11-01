//
//  CrateScene.swift
//  Outline
//
//  Created by Peter on 1/2/17.
//  Copyright © 2017 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

var crate: Crate? = nil

class CrateScene: SKScene {
    
    override func didMove(to view: SKView) {
        self.backgroundColor = GameColor.Black.colorValue
        
        crate = Crate(scene: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        crate?.startopening()
    }
}
