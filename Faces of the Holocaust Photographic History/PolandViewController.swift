//
//  PolandViewController.swift
//  Faces of the Holocaust Photographic History
//
//  Created by New User on 8/22/17.
//  Copyright © 2017 New User. All rights reserved.
//

import UIKit

class PolandViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "CustomTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        

        self.items = loadPlist()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlist()->[[String:String]]{
        let path = Bundle.main.path(forResource: "ResourceList", ofType: "plist")
        
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }

    var selectedIndex:IndexPath?
    var isExpanded = false
    
    func didExpandCell(){
        
        self.isExpanded = !isExpanded
        self.tableView.reloadRows(at: [selectedIndex!], with: .automatic)
        
    }
    

}

extension PolandViewController:UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedIndex = indexPath
        self.didExpandCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let item = self.items[indexPath.row]
        
        cell.titleLabel.text = item["title"]
        cell.shortLabel.text = item["short"]
        cell.otherImage.image = UIImage.init(named: item["image"]!)
        cell.thumbImage.image = UIImage.init(named: item["image"]!)
        cell.longLabel.text = item["long"]
        
                
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let height = UIScreen.main.bounds.height
        
        
        
        
        if isExpanded && self.selectedIndex == indexPath{
            //return self.view.frame.size.height * 0.6
            return 400
        }
        
        return 110
         //return height * 0.2
        
    }
}
