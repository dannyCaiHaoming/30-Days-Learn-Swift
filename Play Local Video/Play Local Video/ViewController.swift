//
//  ViewController.swift
//  Play Local Video
//
//  Created by 蔡浩铭 on 2017/9/28.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MyTableViewCellDelegate {

    let data = [
        CellData(video:NSURL.init(string: "")!, bgImage:UIImage.init(named: "videoScreenshot01")!, title:"Introduce 3DS Mario"),
        CellData(video:NSURL.init(string: "")!, bgImage:UIImage.init(named: "videoScreenshot02")!, title:"Emoji Among Us"),
        CellData(video:NSURL.init(string: "")!, bgImage:UIImage.init(named: "videoScreenshot03")!, title:"Seals Documentary"),
        CellData(video:NSURL.init(string: "")!, bgImage:UIImage.init(named: "videoScreenshot04")!, title:"Adventure Time")
    ]
    
    var tableView :UITableView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Video"
        
        tableView = UITableView.init(frame: UIScreen.main.bounds)
        tableView?.backgroundColor = UIColor.black
        tableView?.separatorColor = UIColor.clear
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        self.view.addSubview(tableView!)
        
        
        
        
        
    }

    
    
    //MARK: UITableViewDelegate & UITableViewDatasource
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return data.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellData:CellData? = data[indexPath.row]
        let mycell:MyTableViewCell = MyTableViewCell.initialMyCell(cellData: cellData)
        mycell.delegate = self
        return mycell as UITableViewCell
    }
    
    
     public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return (UIScreen.main.bounds.height - 64) / 3
    }
    
    
    //MARK: @objc protocol MyTableViewCellDelegate
    func myTableViewPlayButtonAction(cell: MyTableViewCell){
        let path = Bundle.main.path(forResource: "emojizone", ofType: "mp4")
        let avPlayer = AVPlayer.init(url: URL(fileURLWithPath: path!))
        let avPlayerController = AVPlayerViewController.init()
        avPlayerController.player = avPlayer
        self.present(avPlayerController, animated: true) {
            avPlayerController.player!.play()
        }
    }
    
    //MARK:
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

