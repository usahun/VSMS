//
//  HomeController.swift
//  VSMS
//
//  Created by Rathana on 3/13/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

enum MotorContent: Int, CustomStringConvertible{
    case Motor1
    case Motor2
    case Motor3
    case Motor4
    case Motor5
    case Motor6
    case Motor7
    case Motor8
    case Motor9
    
    var description: String
    {
        switch self
        {
        case .Motor1:
            return "Honday Dream 2019"
        case .Motor2:
            return "Honda PCX 2019"
        case .Motor3:
            return "Kawasaki 2019"
        case .Motor4:
            return "Honda Zoomer X 2019"
        case .Motor5:
            return "Suzuki Nex 2019"
        case .Motor6:
            return "Suzuki Smash 2019"
        case .Motor7:
            return "Honda Scoopy 2019"
        case .Motor8:
            return "Honda Click 2019"
        case .Motor9:
            return "Wave 2019"
        }
    }
    var ImageContent: UIImage
    {
        switch self
        {
        case .Motor1:
            return UIImage(named: "HondaDream2019") ?? UIImage()
        case .Motor2:
            return UIImage(named: "HondaPCX2019") ?? UIImage()
        case .Motor3:
            return UIImage(named: "Kawasaki2019") ?? UIImage()
        case .Motor4:
            return UIImage(named: "HondaZoomerX2019") ?? UIImage()
        case .Motor5:
            return UIImage(named: "SuzukiNex2019") ?? UIImage()
        case .Motor6:
            return UIImage(named: "SuzukiSmash2019") ?? UIImage()
        case .Motor7:
            return UIImage(named: "HondaScoopy2019") ?? UIImage()
        case .Motor8:
            return UIImage(named: "HondaClick2019") ?? UIImage()
        case .Motor9:
            return UIImage(named: "HondaWave2019") ?? UIImage()
        }
    }
    
    var PriceLabel: Double
    {
        switch self
        {
            
        case .Motor1:
            return 1800
        case .Motor2:
            return 1900
        case .Motor3:
            return 2000
        case .Motor4:
            return 2100
        case .Motor5:
            return 2200
        case .Motor6:
            return 2300
        case .Motor7:
            return 2400
        case .Motor8:
            return 2500
        case .Motor9:
            return 2600
        }
    }
}

class HomePageController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuButton.target = revealViewController()
        menuButton.action = #selector(SWRevealViewController().revealToggle(_:))
        
        view.addGestureRecognizer(revealViewController()!.panGestureRecognizer())
    }
    

    //Handler
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as! HomeCollectionViewCell
        
        let Motor = MotorContent(rawValue: indexPath.row)
        cell.ImageCollection.image = Motor?.ImageContent
        cell.ContentTitle.text = Motor?.description
        cell.CurrentPriceLabel.text = "$ \(Motor?.PriceLabel ?? 0)"
        cell.OldPriceLabel.text = "$ \((Motor?.PriceLabel ?? 0) + 200 )"
        
        return cell
    }
    

}
