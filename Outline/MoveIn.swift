//
//  MoveIn.swift
//  Outline
//
//  Created by Peter on 12/22/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

var moveInLeft: SKAction {
    return SKAction.group([SKAction.fadeOut(withDuration: 0), SKAction.moveBy(x: 250, y: 0, duration: 0),
                           SKAction.fadeIn(withDuration: 0.5), SKAction.moveBy(x: -250, y: 0, duration: 0.5)])
}

var moveInRight: SKAction {
    return SKAction.group([SKAction.fadeOut(withDuration: 0), SKAction.moveBy(x: -250, y: 0, duration: 0),
                           SKAction.fadeIn(withDuration: 0.5), SKAction.moveBy(x: 250, y: 0, duration: 0.5)])
}
