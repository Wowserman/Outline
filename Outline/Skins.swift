//
//  Skins.swift
//  Outline
//
//  Created by Peter on 12/13/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

enum Skins {
    case None
    case Earth
    case Coin
    case PianoKeys
    case RubixCube
    case German
    case Ireland
    case UnitedStates
    case Finland
    case Denmark
    case Norway
    case Sweden
    case Island
    
    var PulseType: PulseType? {
        switch self {
        case .None:
            return nil
        case .Earth:
            return .Ring
        case .Coin:
            return .Ring
        case .RubixCube:
            return .Square
        case .PianoKeys:
            return .Square
        case .German:
            return .Ring
        case .Ireland:
            return .Ring
        case .UnitedStates:
            return .Ring
        case .Finland:
            return .Ring
        case .Denmark:
            return .Ring
        case .Norway:
            return .Ring
        case .Sweden:
            return .Ring
        case .Island:
            return .Ring
        }
    }
    
    var texture: SKTexture? {
        switch self {
        case .None:
            return nil
        case .Earth:
            return SKTexture(imageNamed: "earth-skin")
        case .Coin:
            return SKTexture(imageNamed: "coin-skin")
        case .RubixCube:
            return SKTexture(imageNamed: "rubixcube-skin.png")
        case .PianoKeys:
            return SKTexture(imageNamed: "pianokeys-skin.png")
        case .German:
            return SKTexture(imageNamed: "german-skin.png")
        case .Ireland:
            return SKTexture(imageNamed: "ireland-skin.png")
        case .UnitedStates:
            return SKTexture(imageNamed: "unitedstates-skin.png")
        case .Finland:
            return SKTexture(imageNamed: "finland-skin.png")
        case .Denmark:
            return SKTexture(imageNamed: "denmark-skin.png")
        case .Norway:
            return SKTexture(imageNamed: "norway-skin.png")
        case .Sweden:
            return SKTexture(imageNamed: "sweden-skin.png")
        case .Island:
            return SKTexture(imageNamed: "island-skin.png")
        }
    }
    
    var isUnlocked: Bool {
        switch self {
        default:
            return storage.bool(forKey: "\(self)")
        }
    }
    
    static func getRandomSkinFor(PulseType: PulseType) -> Skins {
        if Skins.skinsFor(PulseType: PulseType).count > 0 && Skins.hasUnlockedSkinsFor(PulseType: PulseType) {
            var selectedSkin: Skins? = nil
            while selectedSkin == nil {
                let randomSkin = Skins.skinsFor(PulseType: PulseType)[Int(arc4random_uniform(UInt32(Skins.skinsFor(PulseType: PulseType).count)))]
                if randomSkin.isUnlocked == false /* false for testing */{
                    selectedSkin = randomSkin
                    break
                } else { continue }
            }
            return selectedSkin!
        } else {
            return Skins.None
        }
    }
    
    static func skinsFor(PulseType: PulseType) -> [Skins] {
        switch PulseType {
        case .Ring:
            return [.Earth, .Coin, .German, .Ireland, .UnitedStates, .Finland, .Denmark, .Norway, .Sweden, .Island]
        case .Square:
            return [.RubixCube, .PianoKeys]
        default:
            return []
        }
    }
    static func hasUnlockedSkinsFor(PulseType: PulseType) -> Bool {
        for skin in skinsFor(PulseType: PulseType) {
            if skin.isUnlocked {
                return true
            }
        }
        return true
    }
    
    func unlock() {
        storage.set(true, forKey: "\(self)")
    }
    
    static let allValues = [Earth, Coin, PianoKeys, RubixCube, German, Ireland, UnitedStates, Finland, Denmark, Norway, Sweden, Island]
}
