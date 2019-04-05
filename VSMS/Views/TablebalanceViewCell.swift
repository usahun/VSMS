//
//  TablebalanceViewCell.swift
//  VSMS
//
//  Created by usah on 3/31/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class TablebalanceViewCell: UITableViewCell {

    @IBOutlet weak var labelbalance: UILabel!
    @IBOutlet weak var mytotal: UILabel!
    @IBOutlet weak var imagebalance: UIImageView!
    
 
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
}
