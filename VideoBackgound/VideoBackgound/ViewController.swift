//
//  ViewController.swift
//  VideoBackgound
//
//  Created by 蔡浩铭 on 2017/10/23.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: AVPlayerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        let filePath = Bundle.main.path(forResource: "moments", ofType: "mp4")
        let sourceUrl = NSURL.fileURL(withPath: filePath!)
        
//AVPlayerController
        let player = AVPlayer.init(url: sourceUrl)
        
        self.player = player
        
        self.showsPlaybackControls = false
        
        self.player?.play()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        
        
//AVPlayer

//
//        let movieAsset = AVURLAsset.init(url: sourceUrl)
//        
//        let playerItem = AVPlayerItem.init(asset: movieAsset)
//        
//        let player = AVPlayer.init(playerItem: playerItem)
//        
//        let playerLayer = AVPlayerLayer.init(player: player)
//        
//        playerLayer.frame = self.view.bounds
//        
//        self.view.layer.addSublayer(playerLayer)
//        
//        player.play()
    }
    
    
    func playerItemDidReachEnd(){
        self.player?.seek(to: kCMTimeZero)
        self.player?.play()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

