//
//  ViewController.swift
//  CustomFont
//
//  Created by 蔡浩铭 on 2017/9/28.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UITextView!
    
    @IBOutlet weak var changeButton: UIButton!
    
    var font: [String] = ["MFZhiHei_Noncommercial-Regular","MFTongXin_Noncommercial-Regular","MFJinHei_Noncommercial-Regular","Gaspar Regular"]
    
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changeButton.layer.cornerRadius = changeButton.bounds.width / 2;
        
//        open class var familyNames: [String] { get }
//        let familyNames: [String] = UIFont.familyNames
//        for family in familyNames {
//            for font in UIFont.fontNames(forFamilyName: family){
//                print(font)
//            }
//        }
        
        contentLabel.font = UIFont.init(name: font[i], size: 20)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeFontAction(_ sender: Any) {
        i += 1
        if i == 4 {
            i = 0
        }
        contentLabel.font = UIFont.init(name: font[i], size: 20)
        changeButton.titleLabel?.font = UIFont.init(name: font[i], size: 20)
    }
    


}

