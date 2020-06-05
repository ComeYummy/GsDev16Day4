//
//  DetailViewController.swift
//  TableView01
//
//  Created by Naoki Kameyama on 2020/06/05.
//  Copyright © 2020 Naoki Kameyama. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    var kameInfo: KameInfo?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // kameInfoをアンラップ
        guard let kameInfo = kameInfo else { return }
        // 遷移元から引き継がれた値をUIに反映
        iconView.image = UIImage(named: kameInfo.iconName)
        titleLabel.text = kameInfo.title
        descriptionLabel.text = kameInfo.description
    }
}

