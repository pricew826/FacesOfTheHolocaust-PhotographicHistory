//
//  TimelineViewController.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 9/2/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit



class TimelineViewController: UITableViewController {

    @IBAction func nuremberg(_ sender: Any) {
        
        playExternalVideo6()
    }
    
    
    @IBAction func germanySurrenders(_ sender: Any) {
        
        playExternalVideo5()
    }
    
    
    @IBAction func dday(_ sender: Any) {
        
        playExternalVideo4()
    }
    
    
    @IBAction func usEntersWar(_ sender: Any) {
        playExternalVideo3()
    }
    
    
    @IBAction func reichstagButton(_ sender: Any) {
        playExternalVideo1()
        
    }
    
    @IBAction func reichstagSpeechButton(_ sender: Any) {
        
        playExternalVideo2()
    }
    
    
    let videoURLDDay = "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/dday.mp4?alt=media&token=52cdef5b-b6f6-4e3a-b760-262cba437944"
    
    
       let videoURLNuremberg = "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/Nuremberg%20Trial.mp4?alt=media&token=26c51dc6-17cf-44a7-a2fe-22dc684b03ad"
    
    let videoURLReichstag = "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/drf0231a.mp4?alt=media&token=eae46093-8e2b-4115-8b24-6685db1d8547"
    
    
    let videoURLReichstagSpeech = "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/ReichstagSpeech.mp4?alt=media&token=9f0d663e-2ae9-4ec0-9b65-943af380063e"
    
    let videoURLUSEntersWar = "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/USEntersWar.mp4?alt=media&token=f4c27203-a6e5-4780-82e5-b8c057044138"
    
    let videoURLGermanSurrender = "https://firebasestorage.googleapis.com/v0/b/faces-of-the-holocaust.appspot.com/o/Germany%20Surrenders.mp4?alt=media&token=8e1d121f-b02e-4541-b37d-c0d0adeaf8fd"
    
    func playExternalVideo1() {
        
        let videoURL = NSURL(string: self.videoURLReichstag)!
        
        let player = AVPlayer(url: videoURL as URL)
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            () -> Void in
            playerViewController.player!.play()
            
        }
    }
    
    
    func playExternalVideo2() {
        
        let videoURL = NSURL(string: self.videoURLReichstagSpeech)!
        
        let player = AVPlayer(url: videoURL as URL)
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            () -> Void in
            playerViewController.player!.play()
            
        }
    }
    
    func playExternalVideo3() {
        
        let videoURL = NSURL(string: self.videoURLUSEntersWar)!
        
        let player = AVPlayer(url: videoURL as URL)
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            () -> Void in
            playerViewController.player!.play()
            
        }
    }
    
    func playExternalVideo4() {
        
        let videoURL = NSURL(string: self.videoURLDDay)!
        
        let player = AVPlayer(url: videoURL as URL)
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            () -> Void in
            playerViewController.player!.play()
            
        }
    }

    func playExternalVideo5() {
        
        let videoURL = NSURL(string: self.videoURLGermanSurrender)!
        
        let player = AVPlayer(url: videoURL as URL)
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            () -> Void in
            playerViewController.player!.play()
            
        }
    }
    
    func playExternalVideo6() {
        
        let videoURL = NSURL(string: self.videoURLNuremberg)!
        
        let player = AVPlayer(url: videoURL as URL)
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        self.present(playerViewController, animated: true) {
            () -> Void in
            playerViewController.player!.play()
            
        }
    }
    
    
    override func viewDidLoad() {
        

        
        let height = view.bounds.size.height
        let width = view.bounds.size.width


        let path = UIBezierPath()
        path.move(to: CGPoint(x: 18 , y: 30))
        path.addLine(to: CGPoint(x: 18 , y: height - 30))
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.lineWidth = 4.0
        
        //view.layer.addSublayer(shapeLayer)
        
        super.viewDidLoad()
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    }
