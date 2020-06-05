//
//  TableViewCell.swift
//  TableView01
//
//  Created by Naoki Kameyama on 2020/06/05.
//  Copyright © 2020 Naoki Kameyama. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
