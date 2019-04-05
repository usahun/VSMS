//
//  HomeSearchController.swift
//  VSMS
//
//  Created by Rathana on 3/14/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class HomeSearchController: UIViewController, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        
        let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desController = mainStoryBoard.instantiateViewController(withIdentifier: "SearchResultController") as! SearchResultController
        
        let newFrontController = UINavigationController.init(rootViewController: desController)
        let revealController: SWRevealViewController = self.revealViewController()
        revealController.pushFrontViewController(newFrontController, animated: true)
    }

}
