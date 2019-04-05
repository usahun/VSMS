//
//  TablepostviewController.swift
//  VSMS
//
//  Created by usah on 4/3/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class TablepostviewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
  var motospost = ["HondaClick2019", "HondaScoopy2019", "HondaDream2019", "Kawasaki2019"]
    
  var arrayprice = ["2000","3000","1500","2700"]

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellPost", for: indexPath) as! TablepostViewCell
        
      cell.imagemoto.image = UIImage(named: motospost[indexPath.row]+".pmg")
       cell.labelname.text = motospost[indexPath.row]
        cell.labelprice.text = "$ \(arrayprice[indexPath.row])"
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
