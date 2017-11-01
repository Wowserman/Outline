//
//  Prizes.swift
//  Outline
//
//  Created by Peter on 12/4/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit

enum Prizes: Int {
    case Coins
    case TwinCitySkyline
    case EarthSkin
    case CoinSkin
    case RubixCubeSkin
    case PianoKeysSkin
    case GermanSkin
    case IrelandSkin
    case UnitedStatesSkin
    case FinlandSkin
    case DenmarkSkin
    case NorwaySkin
    case SwedenSkin
    case IslandSkin
    
    var cost: Int {
        switch self {
        case .TwinCitySkyline:
            return 1000
        case .EarthSkin:
            return 100
        case .CoinSkin:
            return 500
        case .RubixCubeSkin:
            return 100
        case .PianoKeysSkin:
            return 100
        case .IslandSkin:
            return 500
        default:
            // Flags (so far)
            return 250
        }
    }
    
    func unlock() {
        switch self {
        case .TwinCitySkyline:
            PulseType.TwinCitySkyline.unlock()
        case .Coins:
            addCoins(amount: 50)
        case .EarthSkin:
            Skins.Earth.unlock()
        case .CoinSkin:
            Skins.Coin.unlock()
        case .RubixCubeSkin:
            Skins.RubixCube.unlock()
        case .PianoKeysSkin:
            Skins.PianoKeys.unlock()
        case .GermanSkin:
            Skins.German.unlock()
        case .IrelandSkin:
            Skins.Ireland.unlock()
        case .UnitedStatesSkin:
            Skins.UnitedStates.unlock()
        case .FinlandSkin:
            Skins.Finland.unlock()
        case .DenmarkSkin:
            Skins.Denmark.unlock()
        case .NorwaySkin:
            Skins.Norway.unlock()
        case .SwedenSkin:
            Skins.Sweden.unlock()
        case .IslandSkin:
            Skins.Island.unlock()
        }
    }
    
    var isUnlocked: Bool {
        switch self {
        case .TwinCitySkyline:
            return PulseType.TwinCitySkyline.isUnlocked
        case .Coins:
            return true
        case .EarthSkin:
            return Skins.Earth.isUnlocked
        case .CoinSkin:
            return Skins.Coin.isUnlocked
        case .RubixCubeSkin:
            return Skins.RubixCube.isUnlocked
        case .PianoKeysSkin:
            return Skins.PianoKeys.isUnlocked
        case .GermanSkin:
            return Skins.German.isUnlocked
        case .IrelandSkin:
            return Skins.Ireland.isUnlocked
        case .UnitedStatesSkin:
            return Skins.UnitedStates.isUnlocked
        case .FinlandSkin:
            return Skins.Finland.isUnlocked
        case .DenmarkSkin:
            return Skins.Denmark.isUnlocked
        case .NorwaySkin:
            return Skins.Norway.isUnlocked
        case .SwedenSkin:
            return Skins.Sweden.isUnlocked
        case .IslandSkin:
            return Skins.Island.isUnlocked
        }
    }
    
    var name: String {
        switch self {
        case .TwinCitySkyline:
            return "Twin City Skyline Shape"
        case .Coins:
            return "50 Coins Prize"
        case .EarthSkin:
            return "Earth (Circle Skin)"
        case .CoinSkin:
            return "Mega Coin (Circle Skin)"
        case .RubixCubeSkin:
            return "Rubix Cube (Square Skin)"
        case .PianoKeysSkin:
            return "Piano Keys (Square Skin)"
        case .GermanSkin:
            return "Germany (Circle Skin)"
        case .IrelandSkin:
            return "Ireland (Circle Skin)"
        case .UnitedStatesSkin:
            return "United States (Circle Skin)"
        case .FinlandSkin:
            return "Finland (Circle Skin)"
        case .DenmarkSkin:
            return "Denmark (Circle Skin)"
        case .NorwaySkin:
            return "Norway (Circle Skin)"
        case .SwedenSkin:
            return "Sweden (Circle Skin)"
        case .IslandSkin:
            return "Tropical Island (Circle Skin)"
        }
    }
    
    var unlockable: Bool {
        switch self {
        case .Coins:
            return false
        default:
            return true
        }
    }
    
    var _texture: SKTexture {
        var __texture: SKTexture
        switch self {
        case .TwinCitySkyline:
            __texture = PulseType.TwinCitySkyline.drawingTexture
        case .EarthSkin:
            __texture = Skins.Earth.texture!
        case .CoinSkin:
            __texture = Skins.Coin.texture!
        case .RubixCubeSkin:
            __texture = Skins.RubixCube.texture!
        case .PianoKeysSkin:
            __texture = Skins.PianoKeys.texture!
        case .GermanSkin:
            __texture = Skins.German.texture!
        case .IrelandSkin:
            __texture = Skins.Ireland.texture!
        case .UnitedStatesSkin:
            __texture = Skins.UnitedStates.texture!
        case .FinlandSkin:
            __texture = Skins.Finland.texture!
        case .DenmarkSkin:
            __texture = Skins.Denmark.texture!
        case .NorwaySkin:
            __texture = Skins.Norway.texture!
        case .SwedenSkin:
            __texture = Skins.Sweden.texture!
        case .IslandSkin:
            __texture = Skins.Island.texture!
        default:
            __texture = SKTexture()
        }
        
        return __texture
    }
    
    var isSkin: Bool {
        switch self {
        case .Coins:
            return false
        case .TwinCitySkyline:
            return false
        default:
            return true
        }
    }
    
    static func random() -> Prizes {
        let maxValue = UInt32(Prizes.IslandSkin.rawValue)
        
        return self.init(rawValue: Int(arc4random_uniform(maxValue + 1)))!
    }
}
