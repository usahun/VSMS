//
//  ProductDetailController.swift
//  VSMS
//
//  Created by Rathana on 3/16/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class ProductDetailController: UIViewController {
    //Properties
    var Index:Int = 0
    


    @IBOutlet weak var test: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        test.text = "sadkfjlasdflaskdjfklsajdfklsadjfklsajdlfkasjd;fsjadlfjasdlfjasdlkfjskladjflksadjflksadjflaskdjflkasdjflkasdjfklsadjfklasjdfklsajdflkasjdfklsajdklfjasdklfjsadklfjasklfjsadkjflkasdjfklsadjfklsadjfkls"
        test.sizeToFit()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .default
    }

    @IBAction func BackToSearch(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }
    

}
