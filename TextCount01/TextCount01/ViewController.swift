//
//  ViewController.swift
//  TextCount01
//
//  Created by Naoki Kameyama on 2020/06/04.
//  Copyright © 2020 Naoki Kameyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        textView.text = ""
        textCountLabel.text = "0"

        // 読み方：textViewからコードを任される(通知される)のは、self(このViewController)ですよ
        textView.delegate = self
    }

    // TextViewを変更したときに呼ばれるDelegateメソッド
    func textViewDidChange(_ textView: UITextView) {
        print("textViewDidChangeが呼ばれたよ🐢")
        let count: Int = textView.text.count
        textCountLabel.text = "\(count)"
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        print("textViewDidEndEditingが呼ばれたよ🐢")
    }
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("textViewDidBeginEditingが呼ばれたよ🐢")
    }
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldEndEditingが呼ばれたよ🐢")
        return true
    }
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("textViewShouldBeginEditingが呼ばれたよ🐢")
        return true
    }
    func textViewDidChangeSelection(_ textView: UITextView) {
        print("textViewDidChangeSelectionが呼ばれたよ🐢")
    }

    // TextView外がタップされたときに呼ばれるメソッド（もともとUIViewControllerがもっているメソッドを上書き）
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBeganが呼ばれたよ👿")
        textView.resignFirstResponder()
    }
}

