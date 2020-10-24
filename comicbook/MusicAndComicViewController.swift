//
//  MusicAndComicViewController.swift
//  comicbook
//
//  Created by joseph on 2020/10/23.
//

import UIKit
import SpriteKit
import AVFoundation
class MusicAndComicViewController: UIViewController {
    
    var looper: AVPlayerLooper?

    override func viewDidLoad() {
        super.viewDidLoad()
        //生成SKVIEW物件
        let skView = SKView(frame: view.frame)
        //利用insertsubview將SKView加入到畫面最底層讓它成為背景
        view.insertSubview(skView, at: 0)
        //生成SKScene物件，來控制SKView顯示的內容
        let scene = SKScene(size: skView.frame.size)
        //SKScene的anchorPoint控制scene內容呈現的位置，它的型別是CGPoint，畫面的左下角為(0,0)，右上角為(1,1)。
        scene.anchorPoint = CGPoint(x: 0.5, y: 0)
        //SKEmitterNode專門呈現粒子效果。產生SKEmitterNode時傳入SpriteKitParticleFile的檔名，產生製造魔法效果的SKEmitterNode
        let emitterNode = SKEmitterNode(fileNamed: "MyMagicParticle")
        //從scene呼叫addChild加入SKEmitterNode，讓scene顯示魔法的粒子效果。
        scene.addChild(emitterNode!)
        //skView呼叫presentScene顯示SKScene的內容
        skView.presentScene(scene)
        
        
        //avplayerlooper重覆播放
        if let url = Bundle.main.url(forResource: "最長的旅途", withExtension: "mp3"){
           //生成AVqueueplayer物件
            let player = AVQueuePlayer()
            //利用AVplayeritem生成要放的音樂
            let playerItem = AVPlayerItem(url:url)
            //生成AVPLAYERLOOPER，傳入剛生成的PLAYER&ITEM。 到時候AVPlayerLooper將讓Item重覆播放
            looper = AVPlayerLooper(player: player, templateItem: playerItem)
            //開始播放音樂 player.play
            player.play()
            
    }
    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
