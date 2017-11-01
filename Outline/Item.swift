//
//  Item.swift
//  Outline
//
//  Created by Peter on 11/29/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation

enum Unlockable: String {
    case DefaultColorPack
    case DefaultShapePack
    
    var isUnlocked: Bool {
        return storage.bool(forKey: self.rawValue)
    }
}

func unlock(Unlockable: Unlockable) {
    storage.set(true, forKey: Unlockable.rawValue)
}
