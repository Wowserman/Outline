//
//  SpawnPulse.swift
//  Pulse
//
//  Created by Peter on 11/23/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

func spawnPulse(parent: SKScene) {
    currentPulse.kill()
    
    let type = PulseType.random()
    var actionType = ActionType.random()
    
    while (type.isRotateable == false && actionType.rotates) || (type.isWarpable == false && actionType.warps) {
        actionType = ActionType.random()
    }
    
    Pulse(parent: parent, position: CGPoint(x: 0, y: 0), type: type, actionType: actionType)
}
