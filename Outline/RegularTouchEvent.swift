//
//  TouchesBegan.swift
//  Outline
//
//  Created by Peter on 12/22/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

// Called whenever a touch happens and the touch didn't press on any Button.
func regularTouch(location: CGPoint, node: SKNode, scene: SKScene) {
    if scene.name == "GamePlay" && paused == false {
        // User hasn't touched any buttons and the game isn't paused.
        checkMatching(scene: scene)
    }
}
