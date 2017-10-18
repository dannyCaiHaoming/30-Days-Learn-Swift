//
//  ViewController.swift
//  UIRefreshController
//
//  Created by 蔡浩铭 on 2017/10/18.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var contentArray = [
    "🤡🤡🤡🤡🤡",
    "😤😤😤😤😤",
    "🤠🤠🤠🤠🤠",
    "🤢🤢🤢🤢🤢"
    ]
    
    let tableView = UITableView()
    
    var refreshControl :UIRefreshControl? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.black
        
        tableView.backgroundColor = UIColor.black
        tableView.separatorStyle = .none
        tableView.frame = CGRect.init(x: 0, y: 64, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 64)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.tableFooterView = UIView()
        
        
        //
        refreshControl = UIRefreshControl.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100))
        
        let attributed = NSAttributedString.init(string: "Last updated on\(NSDate())", attributes: [NSForegroundColorAttributeName:UIColor.white])
        refreshControl!.attributedTitle = attributed
        
        tableView.refreshControl = refreshControl
        
        //
        refreshControl!.addTarget(self, action: #selector(ViewController.refreshDataSource), for: UIControlEvents.valueChanged)
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return contentArray.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell.init()
        cell.backgroundColor = UIColor.black
        cell.textLabel?.text = contentArray[indexPath.row]
        cell.textLabel?.textAlignment = NSTextAlignment.center
        cell.textLabel?.font = UIFont.systemFont(ofSize: 40)
        return cell
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 80.0
    }
    
    func refreshDataSource(){
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.contentArray = [
                "🤖🤖🤖🤖🤖",
                "👀👀👀👀👀",
                "🐶🐶🐶🐶🐶",
                "🤡🤡🤡🤡🤡",
                "🤠🤠🤠🤠🤠",
                "🤢🤢🤢🤢🤢"
            ]
            self.tableView.reloadData()
            self.refreshControl!.endRefreshing()
        }

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}

