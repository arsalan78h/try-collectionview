//
//  TableViewCell.swift
//  jssssssoooooooon
//
//  Created by Arsalan Hashemi on 2/28/19.
//  Copyright © 2019 ArSaLaNhashemi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var fieldName: UILabel!
    @IBOutlet weak var imageTittleField: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
