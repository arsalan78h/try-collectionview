//
//  ViewController.swift
//  BJAutoScrollingCollectionViewExample
//
//  Created by BadhanGanesh on 15/01/18.
//  Copyright © 2018 Badhan Ganesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: BJAutoScrollingCollectionView! //Step 1
    
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    let imagesArray = [#imageLiteral(resourceName: "image3"), #imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image0"), #imageLiteral(resourceName: "image2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initCollectionView()
        collectionView.startScrolling()
    }
    
    func initCollectionView() {
        self.collectionView.scrollInterval = 5 //Step 2
        
        self.collectionViewFlowLayout.scrollDirection = .horizontal
        self.collectionViewFlowLayout.minimumInteritemSpacing = 0
        self.collectionViewFlowLayout.minimumLineSpacing = 0
        
        self.collectionView.startScrolling() //Step 3
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier: String = "CustomImageCollectionCell"
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomImageCollectionViewCell
        
        cell.imageView.image = self.imagesArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
    }
    
    ////////////////////////////////////////////////////////////////////////////

    
}


