//
//  ActionType.swift
//  Pulse
//
//  Created by Peter on 11/23/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

import Foundation
import SpriteKit

enum ActionType: Int {
    case scale
    case rotate
    case eightLoop
    case reverseEightLoop
    case firework
    case blink
    //case clock
    case lightspeed
    //case troll
    case cross
    case flip
    
    
    var action: SKAction {
        switch self {
        case .scale:
            return SKAction.sequence([SKAction.scale(to: 0.8, duration: 0), SKAction.scale(to: 1.2, duration: 1), SKAction.scale(to: 0.8, duration: 1)])
        case .rotate:
            return SKAction.sequence([SKAction.rotate(byAngle: CGFloat(M_PI*2), duration: 7.5), SKAction.run({currentPulse.resetZPosition()})])
        case .eightLoop:
            return SKAction.sequence([SKAction.move(to: currentPulse.position.add(x: -50, y: 50), duration: 0),
                                      SKAction.move(to: currentPulse.position.add(x: 50, y: -50), duration: 0.8),
                                      SKAction.move(to: currentPulse.position.add(x: -50, y: -50), duration: 0.4),
                                      SKAction.move(to: currentPulse.position.add(x: 50, y: 50), duration: 0.8),
                                      SKAction.move(to: currentPulse.position.add(x: -50, y: 50), duration: 0.4)])
        case .reverseEightLoop:
            return SKAction.sequence([SKAction.move(to: currentPulse.position.add(x: 50, y: -50), duration: 0),
                                      SKAction.move(to: currentPulse.position.add(x: -50, y: 50), duration: 0.8),
                                      SKAction.move(to: currentPulse.position.add(x: 50, y: 50), duration: 0.4),
                                      SKAction.move(to: currentPulse.position.add(x: -50, y: -50), duration: 0.8),
                                      SKAction.move(to: currentPulse.position.add(x: 50, y: -50), duration: 0.4)])
        case .firework:
            return SKAction.sequence([SKAction.fadeOut(withDuration: 0),
                                      SKAction.move(to: currentPulse.position.add(x: 0, y: -currentPulse.drawingSize.height/2), duration: 0),
                                      SKAction.group([
                                        SKAction.scale(to: 1, duration: 0),
                                        SKAction.fadeIn(withDuration: 0.5),
                                        SKAction.move(to: currentPulse.position.add(x: 0, y: currentPulse.drawingSize.height/4), duration: 2)]),
                                      SKAction.group([SKAction.fadeOut(withDuration: 0.2), SKAction.scale(to: 1.5, duration: 0.2)])])
        case .blink:
            return SKAction.sequence([SKAction.move(to: currentPulse.position, duration: 0),
                                      SKAction.fadeIn(withDuration: 0.2),
                                      SKAction.fadeOut(withDuration: 0.2),
                                      SKAction.move(to: currentPulse.position.add(x: 0, y: 100), duration: 0),
                                      SKAction.wait(forDuration: 0.6)])
            /*case .troll:
             return SKAction.sequence([SKAction.scale(to: 0.8, duration: 0),
             SKAction.scale(to: 0.95, duration: 0.1875),
             SKAction.wait(forDuration: 0.5625),
             SKAction.scale(to: 1.2, duration: 0.5625),
             SKAction.wait(forDuration: 0.25),
             SKAction.fadeOut(withDuration: 0.125),
             SKAction.fadeIn(withDuration: 0.125),
             SKAction.scale(to: 0.8, duration: 0.5)])*/
            /*case .clock:
             return SKAction.repeat(
             SKAction.sequence([
             SKAction.rotate(byAngle: -CGFloat(M_PI/12), duration: 0),
             SKAction.wait(forDuration: 1/3)
             ]
             )
             , count: 12)
             */
        case .lightspeed:
            return SKAction.sequence([
                SKAction.wait(forDuration: 0.25),
                SKAction.scale(to: 0, duration: 0.75),
                SKAction.fadeOut(withDuration: 0),
                SKAction.wait(forDuration: 0.5),
                SKAction.scale(to: 5, duration: 0),
                SKAction.group([
                    SKAction.scale(to: 1, duration: 1.5),
                    SKAction.fadeIn(withDuration: 0.5)
                    ])
                ])
            
        case .cross:
            return SKAction.sequence([SKAction.move(to: currentPulse.position.add(x: 0, y: 0), duration: 0),
                                      SKAction.move(to: currentPulse.position.add(x: 75, y: 0), duration: 0.6),
                                      SKAction.move(to: currentPulse.position.add(x: 0, y: 0), duration: 0.6),
                                      SKAction.move(to: currentPulse.position.add(x: -75, y: 0), duration: 0.6),
                                      SKAction.move(to: currentPulse.position.add(x: 0, y: 0), duration: 0.6)])
            
        case .flip:
            return SKAction.sequence([SKAction.scaleY(to: 0, duration: 1.2),
                                      SKAction.scaleY(to: 1, duration: 1.2),
                                      SKAction.scaleY(to: 0, duration: 1.2),
                                      ])
        }
        
    }
    
    var rotates: Bool {
        switch self {
        case .rotate:
            return true
            //case .clock:
        //   return true
        default:
            return false
        }
    }
    
    var warps: Bool {
        switch self {
        default:
            return false
        }
    }
    
    static func random() -> ActionType {
        let maxValue = UInt32(ActionType.flip.rawValue)
        let rand = arc4random_uniform(maxValue + 1)
        print(self.init(rawValue: Int(rand))!)
        return self.init(rawValue: Int(rand))!
    }
}
