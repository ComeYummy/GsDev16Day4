//
//  ViewController.swift
//  TableView01
//
//  Created by Naoki Kameyama on 2020/06/05.
//  Copyright © 2020 Naoki Kameyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    let infoLists: [KameInfo] = [
        KameInfo(iconName: "02", title: "もでーん", description: "おなかいっぱいなかめくん"),
        KameInfo(iconName: "12", title: "ぐしゅん", description: "泣き虫かめくん"),
        KameInfo(iconName: "14", title: "いまいくの", description: "いくフリしておっくうになってるかめくん"),
        KameInfo(iconName: "19", title: "むりなの", description: "拒否するかめくん"),
        KameInfo(iconName: "22", title: "きゅうけい", description: "さぼってるかめくん"),
        KameInfo(iconName: "28", title: "にゃーっっ", description: "驚いてへんな声だしてるかめくん"),
        KameInfo(iconName: "32", title: "にしー", description: "ほめてもらったかめくん"),
        KameInfo(iconName: "29", title: "わほーい", description: "テンションアゲアゲなかめくん"),
        KameInfo(iconName: "32", title: "にひひ", description: "わるだくみしているかめくん"),
        KameInfo(iconName: "35", title: "もうだめだ・・・", description: "ギブアップしたかめくん"),
        KameInfo(iconName: "avatar", title: "ふつう", description: "やさしげなかめくん")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // tableViewのUI処理を任せるのは自分だよ
        tableView.delegate = self
        // tableViewのデータ処理を任せるのは自分だよ
        tableView.dataSource = self

        configureTableViewCell()

        // セパレーターの線をなくす
        tableView.separatorStyle = .none
    }

    // TableViewCellを読み込む関数
    func configureTableViewCell() {
        // TableViewCellのクラス名を指定してNibを作成
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        // Xibに設定したidentifier
        let cellID = "KameCell"
        // TableViewCellにcellのIdentifierを指定して登録
        tableView.register(nib, forCellReuseIdentifier: cellID)
    }

    // tableViewのrowの数を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return infoLists.count
    }

    // tableViewのCellに表示する内容を返すメソッド(indexPathの個数だけ呼ばれるメソッド)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(indexPath)
        // Cellを呼び出すメソッド(ここは覚えてしまおう)
        let cell = tableView.dequeueReusableCell(withIdentifier: "KameCell", for: indexPath) as! TableViewCell

        // iconViewの設定
        cell.iconView.image = UIImage(named: infoLists[indexPath.row].iconName)
        // titleの設定
        cell.titleLabel.text = infoLists[indexPath.row].title
        // descriptionの設定
        cell.descriptionLabel.text = infoLists[indexPath.row].description

        return cell
    }


    // sectionの数を返すDelegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    // sectionの数を返すメソッド
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section\(section)"
    }

    // tableViewのCellの高さを返すメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }

    // tableViewのCellがタップされた時に呼ばれるメソッド
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAt:", indexPath)
        let vc = DetailViewController()
        // タップされたKameInfoを遷移先のvcへ引き継ぐ
        vc.kameInfo = infoLists[indexPath.row]
        // 画面遷移
        navigationController?.pushViewController(vc, animated: true)
    }
}

