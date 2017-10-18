//
//  ViewController.swift
//  CarouselEffect
//
//  Created by 蔡浩铭 on 2017/10/18.
//  Copyright © 2017年 蔡浩铭. All rights reserved.
//

import UIKit




class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let ImageArray = [
    "01-body",
    "02-dark",
    "03-dudu",
    "04-hello",
    "05-hhhhh",
    "06-running"
    ]
    
    let contentArray = [
    "Body⬆️⬇️","Dark ☁️","dudu","hello","😊😊","🏃‍♀️🏃"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView .register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        
        collectionViewFlowLayout.scrollDirection = .horizontal
        
        collectionViewFlowLayout.minimumLineSpacing = 0.0
        
        collectionViewFlowLayout.minimumInteritemSpacing = 0.0
        
        collectionViewFlowLayout.itemSize = UIScreen.main.bounds.size
        
        collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: false)
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return ImageArray.count
    }
    
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    @available(iOS 6.0, *)
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage.init(named: ImageArray[indexPath.item])
        cell.contentLable.text = contentArray[indexPath.item]
        return cell
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }


}

