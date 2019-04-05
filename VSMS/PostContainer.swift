//
//  PostContainer.swift
//  VSMS
//
//  Created by Rathana on 4/3/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class PostContainer: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //Init
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    //Handler
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath)
        
        cell.textLabel?.text = "Testing"
        return cell
    }
}
