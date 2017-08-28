//
//  FirebaseVidoes.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/25/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit
import Firebase
import AVKit
import AVFoundation

struct postStruct {
    let title : String!
    let message : String!
    let url : URL!
    //let image : UIImage!
}


class FirebaseVidoes: UITableViewController {
    
    
    var posts = [postStruct]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "polandBackgroundBlur.jpg"))
        
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("Posts").queryOrderedByKey().observe(.childAdded, with: {
            
            snapshot in
            
            let snapshotValue = snapshot.value as? NSDictionary
            let title = snapshotValue?["title"] as? String
            let message = snapshotValue?["message"] as? String
            let url = snapshotValue?["url"] as? URL
            //let image = snapshotValue?["image"] as? UIImage
            
            self.posts.insert(postStruct(title: title, message: message, url: url) , at: 0)
            self.tableView.reloadData()
            
            
            

        })

        
        //post()
        // Do any additional setup after loading the view.
    }
    
    
   func post(){
        
        let title = "Title"
        let message = "Message"
        
        
        let post : [String : AnyObject] = ["title": title as AnyObject,
                                            "message": message as AnyObject]
        
        
        let databaseRef = Database.database().reference()
        
        databaseRef.child("Posts").childByAutoId().setValue(post)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
        
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let label1 =  cell?.viewWithTag(1) as! UILabel
            label1.text = posts[indexPath.row].title
        
        let label2 = cell?.viewWithTag(2) as! UILabel
            label2.text = posts[indexPath.row].message
        
        
        
        //let image1 = cell?.viewWithTag(3) as! UIImage
            //image1.UIimage = posts[indexPath.row].image
        
        
        
        return cell!
        
        
        

    }
    
    func tableView(_tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedIndex = indexPath
        
        let url = posts[indexPath.row].url
        let player = AVPlayer(url: url!)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
            playerViewController.player!.play()
        }
        
    }
    
   
    
    
    
}
