//
//  ResultTableViewCell.swift
//  VSMS
//
//  Created by Rathana on 3/14/19.
//  Copyright © 2019 121. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {
    
    var MotorIndex:Int = Int()

    @IBOutlet weak var ResultImage: UIImageView!
    
    @IBOutlet weak var ResultTitle: UILabel!
    
    @IBOutlet weak var ResultPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
