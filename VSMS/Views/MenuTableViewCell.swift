//
//  MenuTableViewCell.swift
//  VSMS
//
//  Created by Rathana on 3/14/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    //Properties
    @IBOutlet weak var ImageIcon: UIImageView!
    @IBOutlet weak var LabelTitle: UILabel!
    
    //Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
