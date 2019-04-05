//
//  TablepostViewCell.swift
//  VSMS
//
//  Created by usah on 4/3/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class TablepostViewCell: UITableViewCell {

   
    @IBOutlet weak var labelname: UILabel!
    @IBOutlet weak var labelprice: UILabel!
    @IBOutlet weak var imagemoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
