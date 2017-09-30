//
//  MyTableViewCell.swift
//  Play Local Video
//
//  Created by 蔡浩铭 on 2017/9/30.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit

struct CellData {
    let video:NSURL
    let bgImage:UIImage
    let title:String
}


@objc protocol MyTableViewCellDelegate: NSObjectProtocol{
    @objc optional func myTableViewPlayButtonAction(cell: MyTableViewCell)
}

class MyTableViewCell: UITableViewCell{

    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    weak open var delegate: MyTableViewCellDelegate?
    
    class func initialMyCell(cellData:CellData?) -> MyTableViewCell {
        let cell: MyTableViewCell = Bundle.main.loadNibNamed("\(self)", owner: nil, options: nil)!.first as! MyTableViewCell
        cell.bgImageView.image = cellData?.bgImage
        cell.titleLabel.text = cellData?.title
        return cell
    }
    
    @IBAction func playButtonAction(_ sender: Any) {
        if self.delegate != nil && ((self.delegate!.myTableViewPlayButtonAction?(cell: self)) != nil){
            self.delegate?.myTableViewPlayButtonAction!(cell: self)
        }
    }
    
    override func awakeFromNib() {
        self.playButton.layer.cornerRadius = self.playButton.bounds.width / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
