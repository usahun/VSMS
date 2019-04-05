//
//  UploadProfileController.swift
//  VSMS
//
//  Created by Rathana on 3/17/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

private var ImageCheck = ""
class UploadProfileController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    //Properties
    @IBOutlet weak var ProfileImage: UIView!
    
    @IBOutlet weak var PostStackView: UIStackView!
    
    @IBOutlet weak var CoverImg: UIImageView!
    @IBOutlet weak var ProfileImg: UIImageView!
    @IBOutlet weak var EditProfileImageButton: UIButton!
    
    
    //sagment
    @IBOutlet weak var PostContainer: UIView!
    @IBOutlet weak var BalancedContainer: UIView!
    
    
    
    //properties Helper
    var ImageOption = UIImagePickerController()
    
    //Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProfileImage.layer.cornerRadius = ProfileImage.frame.width / 2
        ProfileImage.clipsToBounds = true
        
        
        
        CoverImg.isHighlighted = true
        ProfileImg.isHighlighted = true
        
        EditProfileImageButton.layer.cornerRadius = EditProfileImageButton.frame.width / 2
        EditProfileImageButton.clipsToBounds = true
    }
    
    
    //Handler
    
    @IBAction func UploadCoverBtn(_ sender: UIButton) {
        ImageCheck = "Cover"
        AlertCoverPhotoTab(ImageType: CoverImg)
    }
    
    @IBAction func ProfileClick(_ sender: UIButton) {
        ImageCheck = "Profile"
        AlertCoverPhotoTab(ImageType: ProfileImg)
    }
    
    func AlertCoverPhotoTab(ImageType: UIImageView)
    {
        let ImgOption = UIAlertController()
        
        
        if !ImageType.isHighlighted
        {
            print("take pic")
            let ViewImg = UIAlertAction(title: "View Photo", style: .default) { (_) in
                self.ViewPhoto(ImageType: ImageType)
            }
            ImgOption.addAction(ViewImg)
        }
        
        let ChoseImage = UIAlertAction(title: "Choose photo", style: .default, handler: ChoosePhoto)
        let TakePic = UIAlertAction(title: "Take a picture", style: .default, handler: TakePhoto)
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ImgOption.addAction(ChoseImage)
        ImgOption.addAction(TakePic)
        ImgOption.addAction(Cancel)
        
        if !ImageType.isHighlighted
        {
            let RemoveImg = UIAlertAction(title: "Remove Photo", style: .destructive) { (_) in
                self.RemovePhoto(ImageType: ImageType)
            }
            ImgOption.addAction(RemoveImg)
        }
        
        self.present(ImgOption, animated: true, completion: nil)
    }
    
    func ViewPhoto(ImageType: UIImageView)
    {
            print("View Photo")
    }
    
    func ChoosePhoto(action: UIAlertAction)
    {
        print("Choose Photo")
        ImageOption.delegate = self
        ImageOption.sourceType = .photoLibrary
        self.present(ImageOption, animated: true, completion: nil)
    }
    
    func TakePhoto(action: UIAlertAction)
    {
        print("take")
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            ImageOption.delegate = self
            ImageOption.sourceType = .camera
            self.present(ImageOption, animated: true, completion: nil)
        }
        else{
            print("false")
            let AlertMessage = UIAlertController(title: "Warning", message: "Camera is not available.", preferredStyle: .alert)
            AlertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(AlertMessage, animated: true, completion: nil)
        }
    }
    
    func RemovePhoto(ImageType: UIImageView)
    {
        ImageType.image = nil
        ImageType.isHighlighted = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let IMG = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            if ImageCheck == "Profile"
            {
                ProfileImg.isHighlighted = false
                ProfileImg.image = IMG
            }
            else if ImageCheck == "Cover"
            {
                CoverImg.isHighlighted = false
                CoverImg.image = IMG
            }
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func PostBalancedClick(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            PostContainer.alpha = 0
            BalancedContainer.alpha = 1
        }
        else if sender.selectedSegmentIndex == 1
        {
            PostContainer.alpha = 1
            BalancedContainer.alpha = 0
        }
    }
    
}

