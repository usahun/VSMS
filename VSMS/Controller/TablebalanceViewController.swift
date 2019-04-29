//
//  TablebalanceViewController.swift
//  VSMS
//
//  Created by usah on 3/28/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit
class TablebalanceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
   // var delegateFunc: tabSwitch!
    var motosbalance = ["HondaClick2019", "HondaScoopy2019", "HondaDream2019", "Kawasaki2019"]
    var storeMotrs: [String] = []
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(motosbalance.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:  "CellBalance", for: indexPath) as! TablebalanceViewCell
        
        cell.imagebalance.image = UIImage(named: motosbalance[indexPath.row]+".png")
        cell.labelbalance.text = motosbalance[indexPath.row]
        cell.mytotal.text = "Total: \((indexPath.item + 1))" 
        return(cell)
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            motosbalance.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .bottom)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
   // @IBAction func kk(_ sender: UIButton) {
       // self.delegateFunc.tabSwitchHandle()
   // }
    
}
