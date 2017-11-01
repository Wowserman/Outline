//
//  MoveOut.swift
//  Outline
//
//  Created by Peter on 12/22/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

var moveOutLeft: SKAction {
    return SKAction.sequence([SKAction.group([SKAction.fadeOut(withDuration: 0.5), SKAction.moveBy(x: -250, y: 0, duration: 0.5)]),
                              SKAction.moveBy(x: 250, y: 0, duration: 0)])
}

var moveOutRight: SKAction {
    return SKAction.sequence([SKAction.group([SKAction.fadeOut(withDuration: 0.5), SKAction.moveBy(x: 250, y: 0, duration: 0.5)]),
                              SKAction.moveBy(x: -250, y: 0, duration: 0)])
}
