//
//  Stock Transfer.swift
//  VSMS
//
//  Created by usah on 3/24/19.
//  Copyright © 2019 121. All rights reserved.
//

import Foundation

import UIKit

//protocol tabSwitch {
//    func tabSwitchHandle()
//}


enum StoreProcess: Int {
    case banlance
    case post
}

protocol StoreProcessDelegate: class {
    func callbackType(_ with: [String], type: StoreProcess)
}

class StockTranfer : UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    func tabSwitchHandle() {
//        Post.alpha = 0
//        Balance.alpha = 1
//        linebalance.isHidden = false
//        linepost.isHidden = true
//
//        print("Hello from the other side")
//    }
    //Hello
    
    
    
    @IBOutlet weak var imagebackground: UIImageView!
    
    @IBAction func Uploadimage(_ sender: Any)
    {
      let image = UIImagePickerController()
      image.delegate = self
        
        image.allowsEditing = false
        self.present(image, animated: true){}
    }
  
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage
        {
            imagebackground.image = image
        }
        else
        {
            //Error Message
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var balanceViewController: TablebalanceViewController?
    @IBOutlet weak var postViewController: TablepostviewController?
    
    @IBOutlet weak var Post: UIView!
    @IBOutlet weak var Balance: UIView!
    @IBOutlet weak var linebalance: UIView!
    @IBOutlet weak var linepost: UIView!
    @IBOutlet weak var img: UIImageView!
    
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.layer.cornerRadius = img.frame.width * 0.5
        img.clipsToBounds = true
      
        
    }
    
    
    @IBAction func switc (_ Sender: UISegmentedControl){
        if Sender.selectedSegmentIndex == 1 {
            Post.alpha = 0
            Balance.alpha = 1
            linebalance.isHidden = false
            linepost.isHidden = true
        } else {
            Post.alpha = 1
            Balance.alpha = 0
            linepost.isHidden = false
            linebalance.isHidden = true
        }
    }
    
}














