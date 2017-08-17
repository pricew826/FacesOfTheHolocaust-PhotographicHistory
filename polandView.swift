//
//  polandView.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/17/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit

class polandView: UITableView {

    @IBOutlet weak var tableView: polandView!
   
    var items = [[String:String]]()
    
    self.items = loadPlist()
    
    
    
    func loadPlist() -> [[String:String]]{
        
        let path = Bundle.main.path(forResource: "ResourceList", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }

}

extension ViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
    }
}
