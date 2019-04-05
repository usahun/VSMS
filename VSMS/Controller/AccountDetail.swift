//
//  AccountDetail.swift
//  VSMS
//
//  Created by usah on 3/11/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit
class AccountDetail: UIViewController{
    
    
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        img.layer.cornerRadius = img.frame.width * 0.5
        img.clipsToBounds = true
        
    }
}
