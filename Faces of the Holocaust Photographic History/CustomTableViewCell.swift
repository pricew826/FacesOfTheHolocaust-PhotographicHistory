//
//  CustomTableViewCell.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/22/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var shortLabel: UILabel!
    
    @IBOutlet weak var longLabel: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
