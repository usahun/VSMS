//
//  SearchResultController.swift
//  VSMS
//
//  Created by Rathana on 3/14/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class SearchResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    //Properties
    var Index:Int = 0
    
    @IBOutlet weak var leftButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        leftButton.target = revealViewController()
        leftButton.action = #selector(SWRevealViewController().revealToggle(_:))
        
        view.addGestureRecognizer(revealViewController()!.panGestureRecognizer())
    }
    
    //Handler
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultCell", for: indexPath) as! ResultTableViewCell
        
        let Motor = MotorContent(rawValue: indexPath.row)
        cell.MotorIndex = indexPath.row
        cell.ResultImage.image = Motor?.ImageContent
        cell.ResultTitle.text = Motor?.description
        cell.ResultPrice.text = "$ \((Motor?.PriceLabel ?? 0))"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.Index = indexPath.row
        performSegue(withIdentifier: "sw_ProductDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProductDetailController
        vc.Index = self.Index
    }
}
