//
//  ViewController.swift
//  BJAutoScrollingCollectionViewExample
//
//  Created by BadhanGanesh on 15/01/18.
//  Copyright © 2018 Badhan Ganesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageItems = ImgaeSlider(data: [SliderDatum](), result: true, error: "") //new var for handel json for decoding
    var flagHandel : Bool = false //when there is image link in array flag is true and else in false for return
    var imageArr : [String] = [""] //new string array for putting links on that
    ///////////////////////////TableViewCategories variables:
    var categoriesItems = [JsonstructElement]()
    
    var SProjectsItems = SProject(data: [SProjectsDatum](), paginate: "", msg: "", success: true, maxNumPages: 37, total: "")
    
   var SProjectsDataArr = [SProjectsDatum]()

    
    
    @IBOutlet weak var collectionView: BJAutoScrollingCollectionView! //Step 1
    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
///////////////////////////////////////////////////////////////
    @IBOutlet weak var tableViewCategories: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDataPhotoSlider()
        getDataForCategories()
        getdataForSProjects()
        
        tableViewCategories.isScrollEnabled = false
       
        
        self.initCollectionView()
        collectionView.startScrolling()
    }
    //auto layout height of the  categories tableView for number of rows
    override func viewDidLayoutSubviews(){
        tableViewCategories.frame = CGRect(x: tableViewCategories.frame.origin.x, y: tableViewCategories.frame.origin.y, width: tableViewCategories.frame.size.width, height: tableViewCategories.contentSize.height)
        tableViewCategories.reloadData()
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
    func getDataPhotoSlider(){
        let url = URL(string: "https://www.karishe.com/wp-json/wp/v2/slider?name=Dashboard")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do { if error == nil{
                self.imageItems = try JSONDecoder().decode(ImgaeSlider.self, from: data!)
                self.imageArr.removeAll()  //be empty array for put new links on that
                
                DispatchQueue.main.async {
                for img in self.imageItems.data{
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

extension ViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoriesItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        ////////////////////////////////// - Load text menu field
       // cell.fieldName.text = "\(categoriesItems[indexPath.row].name)"
        
     //   loadFieldName(indexPath: indexPath.row, cell: cell, toIndexPath: 4)
        ////////////////////////////////// - Load Image URL
        
     //   loadImage(indexPath: indexPath.row, cell: cell , toIndexPath : 4)
        
        loadCategoriesCell(indexPath: indexPath.row, cell: cell, toIndexPath: 12)
        
        return cell
    }
    func loadCategoriesCell(indexPath: Int, cell: TableViewCell, toIndexPath: Int){
        
        loadFieldName(indexPath: indexPath, cell: cell, toIndexPath: toIndexPath)
    
       // loadImage(indexPath: indexPath, cell: cell , toIndexPath : toIndexPath)
        if indexPath != 7 {
        if let url = NSURL(string: categoriesItems[indexPath].image!) {
            if let data = NSData(contentsOf: url as URL) {
                cell.imageTittleField.image = UIImage(data: data as Data)
            }
        }
    }
}
    
    func getDataForCategories(){
        let url = URL(string: "http://www.karishe.ir/wp-json/wp/v2/all-terms?term=project_category")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do { if error == nil{
                self.categoriesItems = try JSONDecoder().decode([JsonstructElement].self, from: data!)
                for _ in self.categoriesItems{
                    DispatchQueue.main.async {
                        
                        self.tableViewCategories.reloadData()
                    }
                }
                }
            }catch{
                print("Error in get json data \(error)")
            }
            }.resume()
    }
    
    func getdataForSProjects(){
        let url = URL(string: "https://www.karishe.com/wp-admin/admin-ajax.php?query%5Bpost_type%5D=project&query%5Bpost_status%5D=publish&query%5Borderby%5D=date&query%5Bplace_category%5D=&query%5Bmeta_key%5D=&query%5Bmeta_value%5D=&query%5Blocation%5D=&query%5Bshowposts%5D=&query%5Border%5D=DESC&query%5Bis_archive_project%5D=true&query%5Bpaginate%5D=page&page=1&paged=1&paginate=page&action=ae-fetch-projects&query%5Bs%5D=&query%5Bskill%5D=Android&query%5Bskill%5D=")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do { if error == nil{
                self.SProjectsItems = try JSONDecoder().decode(SProject.self, from: data!)
                
                DispatchQueue.main.async {
                    for titel in self.SProjectsItems.data{
                        self.SProjectsDataArr.append(titel)
                        
                    }
                    // self.collectionView.reloadData() //reload data for load image in collectionView
                }
                }
            }catch{
                print("Error in get json data \(error)")
            }
            }.resume()
    }
    
    func loadFieldName(indexPath : Int , cell : TableViewCell , toIndexPath : Int) {
        if indexPath < toIndexPath {
            cell.fieldName.text = "\(categoriesItems[indexPath].name)"
        }
    }
    
    func loadImage(indexPath : Int , cell : TableViewCell , toIndexPath : Int) {
        
        let session = URLSession(configuration: .default)
        if (indexPath < toIndexPath) {
            if indexPath != 7{
                let URL_IMAGE = URL(string: categoriesItems[indexPath].image! )
                //creating a dataTask
                let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
                    //if there is any error
                    if let e = error {
                        //displaying the message
                        print("Error Occurred: \(e)")
                    } else {
                        //in case of now error, checking wheather the response is nil or not
                        if (response as? HTTPURLResponse) != nil {
                            //checking if the response contains an image
                            if let imageData = data {
                                //getting the image
                                let image = UIImage(data: imageData)
                                
                                DispatchQueue.main.async {
                                cell.imageTittleField.image = image
                                }
                            } else {
                                print("Image file is currupted")
                            }
                        } else {
                            print("No response from server")
                        }
                    }
                }
                //starting the download task
                getImageFromUrl.resume()
            }
        }
    }
    
    





    
    
    
    
    
    
    
    
    
    
}
