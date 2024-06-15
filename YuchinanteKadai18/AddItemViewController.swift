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
        case add, edit
    }

    // デフォルトは追加モード
    var mode = Mode.add

    // アイテム名を入力するテキストフィールド
    @IBOutlet weak var nameTextField: UITextField!

    // 入力されたアイテム名を保持するプロパティ
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // 変種モードの場合はテキストフィールドに既存のアイテム名を表示する
        if mode == .edit {
            nameTextField.text = name
        }
    }

    // セーブボタンが押された時の処理
    @IBAction func pressSaveButton(_ sender: Any) {
        // テキストフィールドの値をnameプロパティに設定
        name = nameTextField.text ?? ""
        // モードに応じて適切なセグエ識別子を設定
        let identifier = (mode == .add) ? "exitFromAddBySaveSegue" : "exitFromEditBySaveSegue"
        // セグエを実行して遷移する
        performSegue(withIdentifier: identifier, sender: sender)
    }
    

    // キャンセルボタンが押された時の処理
    @IBAction func pressCancelButton(_ sender: Any) {
        // モードに応じて適切なセグエ識別子を設定
        let identifier = (mode == .add) ? "exitFromAddByCancelSegue" : "exitFromEditByCancelSegue"
        // セグエを実行して遷移する
        performSegue(withIdentifier: identifier, sender: sender)
    }
}
