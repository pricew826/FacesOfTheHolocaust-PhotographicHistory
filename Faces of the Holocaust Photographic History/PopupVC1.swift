//
//  PopupVC1ViewController.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/29/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit

class PopupVC1: VideoTest {
    
    
    

    @IBOutlet weak var textView: UITextView!

    @IBAction func closePopup(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
   
    override func viewDidLayoutSubviews() {
        self.textView.setContentOffset(.zero, animated: false)
        
    }
    
    
   
   
   
    
    
    
}
