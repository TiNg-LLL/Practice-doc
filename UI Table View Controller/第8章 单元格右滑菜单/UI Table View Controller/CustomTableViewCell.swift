//
//  CustomTableViewCell.swift
//  UI Table View Controller
//
//  Created by TiNg-LLL on 2018/1/30.
//  Copyright © 2018年 TiNg-LLL. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var ProvinceLabel: UILabel!
    @IBOutlet weak var PartLabel: UILabel!
    @IBOutlet weak var ThumbImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
