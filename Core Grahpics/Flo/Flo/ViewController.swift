//
//  ViewController.swift
//  Flo
//
//  Created by 蔡浩铭 on 2017/10/26.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pushButonPressed(_ button: PushButtonView) {
        if button.isAddButton {
            if counterView.counter < 8 {
                counterView.counter += 1
            }
        }else{
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = "\(counterView.counter)"
        counterView.setNeedsDisplay()
    }

}

