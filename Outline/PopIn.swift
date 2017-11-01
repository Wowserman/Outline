//
//  PopIn.swift
//  Outline
//
//  Created by Peter on 12/22/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

var popIn: SKAction {
    return SKAction.sequence(
                [SKAction.moveBy(x: 0, y: -50, duration: 0),
                 SKAction.fadeOut(withDuration: 0),
                 SKAction.group([
                        SKAction.fadeIn(withDuration: 0.5),
                        SKAction.moveBy(x: 0, y: 50, duration: 0.5)
                    ]
            )]
        )
}
