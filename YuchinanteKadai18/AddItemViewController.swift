//
//  AddItemViewController.swift
//  YuchinanteKadai18
//  
//  Created by Yuchinante on 2024/06/05
//  
//

import UIKit

class AddItemViewController: UIViewController {

    // 追加モードと編集モードを定義する列挙体
    enum Mode: Equatable {
        case add, edit(String)
    }

    var mode = Mode.add  // デフォルトは追加モード

    // アイテム名を入力するテキストフィールド
    @IBOutlet weak var nameTextField: UITextField!

    var name = ""  // 入力されたアイテム名を保持するプロパティ

    override func viewDidLoad() {
        super.viewDidLoad()

        // 変種モードの場合はテキストフィールドに既存のアイテム名を表示する
        switch mode {
        case .add:
            break
        case .edit(let name):
            nameTextField.text = name
        }
    }

    // セーブボタンが押された時の処理
    @IBAction func pressSaveButton(_ sender: Any) {
        // テキストフィールドの値をnameプロパティに設定
        name = nameTextField.text ?? ""

        let identifier = (mode == .add) ? "exitFromAddBySaveSegue" : "exitFromEditBySaveSegue"
        // セグエを実行して遷移する
        performSegue(withIdentifier: identifier, sender: sender)
    }
    

    // キャンセルボタンが押された時の処理
    @IBAction func pressCancelButton(_ sender: Any) {
        let identifier = (mode == .add) ? "exitFromAddByCancelSegue" : "exitFromEditByCancelSegue"
        // セグエを実行して遷移する
        performSegue(withIdentifier: identifier, sender: sender)
    }
}
