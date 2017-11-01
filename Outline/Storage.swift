//
//  Storage.swift
//  Outline
//
//  Created by Peter on 11/27/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import Foundation
import UIKit

let storage = UserDefaults()

var coins: Int {
    return storage.integer(forKey: "coins")
}

func canSpend(amount: Int) -> Bool {
    return coins >= amount
}

func addCoins(amount: Int) {
    storage.set(coins + amount, forKey: "coins")
}

func removeCoins(amount: Int) {
    storage.set(coins - amount, forKey: "coins")
}

var score = 0

fileprivate var _highscore: Int = storage.integer(forKey: "highscore")

var highscore: Int {
    get {
        return _highscore
    }

    set {
        _highscore = newValue
        storage.set(newValue, forKey: "highscore")
    }
}

func setHighscore(newHighscore: Int) {
    storage.set(newHighscore, forKey: "highscore")
}

var launchs: Int {
    return storage.integer(forKey: "launchs")
}

func setLaunch(newLaunches: Int) {
    storage.set(newLaunches, forKey: "launches")
}

func launch() {
    if launchs < 1 {
        PulseType.Ring.unlock()
        PulseType.RoundedSquare.unlock()
        PulseType.Square.unlock()
        PulseType.Star.unlock()
        PulseType.Triangle.unlock()
    }
    
    if isDeveloperModeToggled == true {
        PulseType.Ring.unlock()
        PulseType.RoundedSquare.unlock()
        PulseType.Square.unlock()
        PulseType.Star.unlock()
        PulseType.Triangle.unlock()
        PulseType.TwinCitySkyline.unlock()
    }
    
    setLaunch(newLaunches: launchs + 1)
}

var isDeveloperModeToggled: Bool {
    return storage.bool(forKey: "developermode")
}

func toggleDeveloperMode() {
    storage.set(!isDeveloperModeToggled, forKey: "developermode")
}


fileprivate var _mute: Bool = storage.bool(forKey: "mute")

var mute: Bool {
    get {
        return _mute
    }
    set {
        _mute = newValue
        storage.set(newValue, forKey: "mute")
    }
}

var muteImage: UIImage {
    switch mute {
    case true:
        return UIImage(named: "volume.png")!
    case false:
        return UIImage(named: "volume.png")!.addImageOnTop(topImage: UIImage(named: "x.png")!)
    }
}
