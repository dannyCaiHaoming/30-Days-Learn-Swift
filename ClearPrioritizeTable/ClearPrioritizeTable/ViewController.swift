//
//  ViewController.swift
//  ClearPrioritizeTable
//
//  Created by 蔡浩铭 on 2017/10/24.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var tableData :[String] = [
    "Cleanup bedroom",
    "Go for a run",
    "Hit the gym",
    "Build another swift project",
    "Movement training",
    "Inbox Zero",
    "Booking the Ticket To GZ",
    "Hop on a call to mom",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let glassImageView = LeftGlassesImageView()
//        glassImageView.frame = CGRect.init(x: 50, y: 100, width: 320, height: 100)
//        glassImageView.backgroundColor = UIColor.black
//        self.view.addSubview(glassImageView)
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return tableData.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:UITableViewCell = UITableViewCell.init()
        cell.textLabel?.text = tableData[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = self.colorforIndex(index: indexPath.row)
        
        return cell
    }

    func colorforIndex(index:Int) -> UIColor {
        let itemCount = tableData.count - 1
        let color = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red:1.0,  green: color,  blue:0.0,  alpha:1.0)
    }
    
    

}

