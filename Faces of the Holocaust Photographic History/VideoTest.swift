//
//  VideoTestViewController.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/26/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit



class VideoTest: UIViewController {

    @IBAction func button(_ sender: Any) {
        let playerIsPlaying = player?.rate != 0
        if playerIsPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        
    }
    var player : AVPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url : URL = URL(string: "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/Alan%20Hall.mp4?alt=media&token=19c13572-b6fb-42e9-94e5-535dac227de5")!
        let player = AVPlayer(url: url)
        var playerLayer : AVPlayerLayer?
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravityResizeAspect
        playerLayer!.frame = self.view.frame
        self.view!.layer.addSublayer(playerLayer!)
        player.play()
        
        
        // Do any additional setup after loading the view.
    }
    

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
