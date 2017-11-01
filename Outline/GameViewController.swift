//
//  GameViewController.swift
//  Pulse
//
//  Created by Peter on 11/20/16.
//  Copyright © 2016 Orange Juice. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import iAd

class GameViewController: UIViewController, ADBannerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let home = SKScene(fileNamed: "Home") {
                // Set the scale mode to scale to fit the window
                home.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(home)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
        controllerInstance = self
    }
    
    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .portraitUpsideDown
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

var controllerInstance: GameViewController? = nil

