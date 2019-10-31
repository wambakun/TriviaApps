//
//  ViewController.swift
//  TriviaApps
//
//  Created by DSMacbook on 24/10/19.
//  Copyright © 2019 DSMacbook. All rights reserved.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var sliderCollection: UICollectionView!
    
    @IBOutlet weak var pageView: UIPageControl!
    

    @IBOutlet weak var viewGetStarted: UIView!
    var imgarr = [UIImage(named: "slider1"),UIImage(named: "slider2"),UIImage(named: "slider3")]
    var scrollWitdh: CGFloat! = 0.0
    var scrollHeight: CGFloat = 0.0
    
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.numberOfPages = imgarr.count
        // Do any additional setup after loading the view.
        self.viewGetStarted.layer.cornerRadius = 10
        
        self.sliderCollection.isPagingEnabled = true
        sliderCollection.showsVerticalScrollIndicator = false
        sliderCollection.showsHorizontalScrollIndicator = false
        
        scrollWitdh = sliderCollection.frame.size.width
        scrollHeight = sliderCollection.frame.size.height
        
       
        
        
//        loadData()
        
        
        
    }
    
        
    @IBAction func pageChanged(_ sender: Any) {
        sliderCollection.scrollRectToVisible(CGRect(x: scrollWitdh * CGFloat ((pageView?.currentPage)!), y: 0, width: scrollWitdh, height: scrollHeight), animated: true)
    }
    
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgarr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        cell.image = imgarr[indexPath.item]
        
        scrollWitdh = sliderCollection.frame.size.width
        scrollHeight = sliderCollection.frame.size.height
               
       
        
        return cell
    }
    func collectionView( collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)->CGSize{
        let size = UIScreen.main.bounds
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func colletionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insectForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 100.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        return 100.0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / sliderCollection.frame.size.width)
        pageView.currentPage = currentIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageView.currentPage = indexPath.section
    }
    
    
    
   
    
}
    

    






