//
//  PopupVC5.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/30/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit

class PopupVC5: VideoTest {

    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func closePopup5(_ sender: Any) {
            dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLayoutSubviews() {
        self.textView.setContentOffset(.zero, animated: false)
        
    }

    
}
