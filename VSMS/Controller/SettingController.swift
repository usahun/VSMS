//
//  SettingController.swift
//  VSMS
//
//  Created by usah on 3/17/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class SettingController: UIViewController {

    @IBOutlet weak var buttonactive: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func activeclick(_ sender: UIButton) {
         print(buttonactive.titleLabel?.text ?? "")
        
        let text = buttonactive.titleLabel?.text!
        
        if text == String ("Active")
        {
            buttonactive.setTitle("Disactive", for: .normal)
            buttonactive.setTitleColor(.lightGray, for: .normal)
        }
        else {
           buttonactive.setTitle("Active", for: .normal)
            buttonactive.setTitleColor(.blue, for: .normal)
        }
    }
    @IBAction func backbtnpress(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
