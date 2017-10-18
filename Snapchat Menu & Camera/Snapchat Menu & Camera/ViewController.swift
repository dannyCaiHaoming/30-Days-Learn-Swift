//
//  ViewController.swift
//  Snapchat Menu & Camera
//
//  Created by 蔡浩铭 on 2017/9/30.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController{
    
    let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        do {
            let input = try AVCaptureDeviceInput(device:device)
            if session.canAddInput(input){
                session.addInput(input)
            }
        } catch  {
            print("Error handling the camera Input: \(error)")
            return
        }
        
        let videoPreViewLayer = AVCaptureVideoPreviewLayer(session:session)
        videoPreViewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreViewLayer?.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        videoPreViewLayer?.masksToBounds = true
        self.view .layoutIfNeeded()
        self.view.layer.addSublayer(videoPreViewLayer!)
        
        session.startRunning()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        session.startRunning()
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        session.stopRunning()
//    }
}

class ViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        [UIViewController prefersStatusBarHidden]
        
        let leftViewController = UIViewController()
        leftViewController.view.frame = UIScreen.main.bounds
        let leftImageView = UIImageView.init(frame: UIScreen.main.bounds)
        leftImageView.image = UIImage.init(named: "left")
        leftViewController.view.addSubview(leftImageView)
        
        let cameraViewController = CameraViewController()
        cameraViewController.view.frame = CGRect.init(origin: CGPoint.init(x: UIScreen.main.bounds.width , y: 0), size: UIScreen.main.bounds.size)
       
        let rightViewController = UIViewController()
        rightViewController.view.frame = CGRect.init(origin: CGPoint.init(x: UIScreen.main.bounds.width * 2, y: 0), size: UIScreen.main.bounds.size)
        let rightImageView = UIImageView.init(frame: UIScreen.main.bounds)
        rightImageView.image = UIImage.init(named: "right")
        rightViewController.view.addSubview(rightImageView)
        
        
        self.scrollView.contentSize = CGSize.init(width: UIScreen.main.bounds.width * 3, height: 0)
        self.scrollView.contentOffset = CGPoint.init(x: 0, y: 0)
        self.scrollView.addSubview(leftViewController.view)
        self.scrollView.addSubview(cameraViewController.view)
        self.scrollView.addSubview(rightViewController.view)
        

    }
    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

