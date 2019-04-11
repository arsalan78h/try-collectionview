//
//  ViewController.swift
//  BJAutoScrollingCollectionViewExample
//
//  Created by BadhanGanesh on 15/01/18.
//  Copyright © 2018 Badhan Ganesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageItems = [Datum]() // new var for Datum struct that inside SlideImage(image links)
    var myJsonStruct = ImgaeSlider(data: [Datum](), result: true, error: "") //new var for handel json for decoding
    var flagHandel : Bool = false //when there is image link in array flag is true and else in false for return
    var imageArr : [String] = [""] //new string array for putting links on that
    
    @IBOutlet weak var collectionView: BJAutoScrollingCollectionView! //Step 1
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        self.initCollectionView()
        collectionView.startScrolling()
    }
    
    //MARK: -initial CollectionView timer
    func initCollectionView() {
        self.collectionView.scrollInterval = 5 //Step 2
        
        self.collectionViewFlowLayout.scrollDirection = .horizontal
        self.collectionViewFlowLayout.minimumInteritemSpacing = 0
        self.collectionViewFlowLayout.minimumLineSpacing = 0
        
        self.collectionView.startScrolling() //Step 3
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - delegate and datasource for CollectionView
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier: String = "CustomImageCollectionCell"
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomImageCollectionViewCell
        
        if flagHandel == false { return cell }
        // convert image link to UIimage and put on cell
        let url = imageArr[indexPath.row]
        
        let urls = NSURL(string: url)
        let data = NSData(contentsOf: urls! as URL)

        cell.imageView.image = UIImage(data: data! as Data)
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
    }
    //MARK: - Get data from JSON
    func getdata(){
        let url = URL(string: "https://www.karishe.com/wp-json/wp/v2/slider?name=Dashboard")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do { if error == nil{
                self.myJsonStruct = try JSONDecoder().decode(ImgaeSlider.self, from: data!)
                self.imageArr.removeAll()  //be empty array for put new links on that
                
                DispatchQueue.main.async {
                for img in self.myJsonStruct.data{
                        self.imageArr.append(img.slideImage) //append links on array foe each data
                    }
                    self.flagHandel = true //if be true data of ui image puts in cell imageView
                    self.collectionView.reloadData() //reload data for load image in collectionView
                }
            }
            }catch{
                print("----------------/////////////////////////")
                print("Error in get json data \(error)")
            }
            }.resume()
        }
    }
