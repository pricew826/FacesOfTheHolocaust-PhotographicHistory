//
//  CustomTableViewCell.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/22/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var closeButton: UIImageView!
    
    @IBOutlet weak var otherImage: UIImageView!
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var shortLabel: UILabel!
    
    //@IBOutlet weak var longLabel: UITextView!
    
    @IBOutlet weak var longLabel: UITextView!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        //let width = UIScreen.main.bounds.width
        
        //let height = UIScreen.main.bounds.height
        
        //thumbImage.frame.size.width = height * 0.19
        //thumbImage.frame.size.height = height * 0.19
        
        
        }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        


        // Configure the view for the selected state
        
        
    }
    
}
