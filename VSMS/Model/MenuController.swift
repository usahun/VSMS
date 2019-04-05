//
//  MenuController.swift
//  VSMS
//
//  Created by Rathana on 3/14/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

private let TitleArr = ["Home", "Your Post", "Your Like", "Your Loan", "Your Product"]
private let ImageArr = [UIImage(named: "home-50"), UIImage(named: "upload-to-cloud-50"), UIImage(named: "facebook-like-50"), UIImage(named: "cash-in-hand-50"), UIImage(named: "products-50")]

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //Properties
    var IsStatusBar = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //init
    override func viewWillAppear(_ animated: Bool) {
        IsStatusBar = true
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        IsStatusBar = false
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override var prefersStatusBarHidden: Bool{
        return IsStatusBar
    }
    
    
    //Handler
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TitleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableCell", for: indexPath) as! MenuTableViewCell
        
        cell.LabelTitle.text = TitleArr[indexPath.row]
        cell.ImageIcon.image = ImageArr[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if cell.LabelTitle.text == "Home"
        {
            let mainStoryBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let desController = mainStoryBoard.instantiateViewController(withIdentifier: "HomePageController") as! HomePageController
            
            let newFrontController = UINavigationController.init(rootViewController: desController)
            let revealController: SWRevealViewController = self.revealViewController()
            revealController.pushFrontViewController(newFrontController, animated: true)
        }
    }
}
