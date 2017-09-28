//
//  ViewController.swift
//  Simple Stop Watch
//
//  Created by 蔡浩铭 on 2017/9/28.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet weak var seccondLabel: UILabel!
    
    var timer :Timer? = nil
    var secondSum :Float = 0.0
    var timerBlcok :((Timer) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.timerBlcok = { (Timer) in
            self.secondSum += 0.1
            let format = String(format:"%.1f",self.secondSum)
            self.seccondLabel.text = format
        }
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: self.timerBlcok!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func resetButtonAction(_ sender: Any) {
        self.secondSum = 0.0
        self.seccondLabel.text = "\(0.00)"
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func goonActionButton(_ sender: Any) {
        
        if timer != nil{
            return
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: self.timerBlcok!)
    }
    
    @IBAction func pauseActionButton(_ sender: Any) {
        if timer == nil{
            return
        }
        timer?.invalidate()
        timer = nil
    }
    
}

