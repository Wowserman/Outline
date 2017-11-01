//
//  Gallery.swift
//  Outline
//
//  Created by Peter on 1/1/17.
//  Copyright © 2017 Orange Juice. All rights reserved.
//

import Foundation
import SpriteKit


class Gallery {
    
    private var exhibits = [Exhibit]()
    private var page = 0
    private var size: CGSize
    private var scene: SKScene
    private var galleryNode: SKNode = SKNode()
    private var count: Int {
        return exhibits.count - 1
    }
    
    func addExhibit(ofPrize: Prizes) {
        exhibits.append(Exhibit(size: size, prize: ofPrize))
        updateGallery()
    }
    
    private func updateGallery() {
        galleryNode.removeAllChildren()
        if 0 < count {
            for i in 0 ... count {
                let x = CGFloat(i) * size.width
                let node = exhibits[i].node
                galleryNode.addChild(node)
                node.position = CGPoint(x: x, y: 0)
                print(i)
            }
        }
        if galleryNode.parent == nil {
            scene.addChild(galleryNode)
        }
    }
    
    func next() {
        print(size)
        // Check if they are on the last page
        if page == count {
            // Cancel
            print("Next() Canceled")
            return
        }
        print("Next")
        // Can go to Next Page
        let moveAction = SKAction.moveBy(x: -size.width, y: 0, duration: 1)
        for exhibit in exhibits {
            print("!")
            exhibit.node.run(moveAction)
            print(exhibit.node.position)
            for child in exhibit.node.children {
                child.run(moveAction)
            }
        }
        
        page += 1
    }
    
    func back() {
        // Check if they are on the first page.
        if page > 0 {
            // Cancel
            print("Back() Canceled")
            return
        }
        print("Back")
        // Can go to the Past Page
        let moveAction = SKAction.moveBy(x: size.width, y: 0, duration: 1)
        for exhibit in exhibits {
            exhibit.node.run(moveAction)
            for child in exhibit.node.children {
                child.run(moveAction)
            }
        }
        
        page += -1

    }
    
    init(size: CGSize, scene: SKScene) {
        self.size = size
        self.scene = scene
        updateGallery()
    }
}
