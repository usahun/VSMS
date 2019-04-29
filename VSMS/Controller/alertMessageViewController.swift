//
//  alertMessageViewController.swift
//  VSMS
//
//  Created by usah on 4/23/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class alertMessageViewController: UIViewController {

    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var pageView: UIPageControl!
    
    var imgArr = [  UIImage(named:"Dream191"),
                    UIImage(named:"Dream192") ,
                    UIImage(named:"Dream193")]
    
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.numberOfPages = imgArr.count
        pageView.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
            
            //hide navigation bar
            self.navigationController?.navigationBar.tintColor =  .white
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default )
            self.navigationController?.navigationBar.shadowImage = UIImage()
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Motocycle for Sale", style: .plain, target: nil, action: nil)
            
        }
    }
    
    @IBAction func altertNumberCall(_ sender: UIButton) {
        
        let alertCall = UIAlertController(title: "", message: "Call to the Saller", preferredStyle: .actionSheet)
        
        alertCall.addAction(UIAlertAction(title: "012898879", style: .default, handler: { (action) in
            print("default")
        }))
        alertCall.addAction(UIAlertAction(title: "012888899", style: .default, handler: { (action) in
            print("defaultr")
        }))
        
        alertCall.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            print("Cancel")
        }))
        
        self.present(alertCall, animated: true)
    }
    
    
    
    @objc func changeImage() {
        
        if counter < imgArr.count {
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageView.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.sliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageView.currentPage = counter
            counter = 1
        }
        
    }

}

extension alertMessageViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imgArr[indexPath.row]
        }
        return cell
    }
}

extension alertMessageViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
