//
//  GameScene.swift
//  Project17
//
//  Created by Антон Кашников on 19/12/2023.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    private var starfield: SKEmitterNode!
    private var player: SKSpriteNode!
    private var scoreLabel: SKLabelNode!
    
    private var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        starfield = SKEmitterNode(fileNamed: "starfield")!
        starfield.position = CGPoint(x: 1024, y: 384)
        starfield.advanceSimulationTime(10) // simulate 10 seconds passing in the emitter, thus updating all the particles as if they were created 10 seconds ago
        addChild(starfield)
        starfield.zPosition = -1
        
        player = SKSpriteNode(imageNamed: "player")
        player.position = CGPoint(x: 100, y: 384)
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.size) // per-pixel collision detection
        player.physicsBody?.contactTestBitMask = 1
        addChild(player)
        
        scoreLabel = SKLabelNode(fontNamed: "Chalkduster")
        scoreLabel.position = CGPoint(x: 16, y: 16)
        scoreLabel.horizontalAlignmentMode = .left
        addChild(scoreLabel)
        
        score = 0
        
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
