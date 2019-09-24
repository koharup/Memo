//
//  MemoViewController.swift
//  Meomopad
//
//  Created by koharu on 2019/09/11.
//  Copyright © 2019年 test company. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController,UITextFieldDelegate{
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    var saveDate:UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.text = saveDate.object(forKey: "title") as? String
        contentTextView.text = saveDate.object(forKey: "content") as? String
        titleTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveMemo(){
        //UserDefaultに書き込み
        saveDate.set(titleTextField.text, forKey: "title")
        saveDate.set(contentTextView.text, forKey: "content")
        
        //アラートを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました。",preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
                UIAlertAction(
                    title: "OK",
                    style: .default,
                    handler: { action in
                        //ボタンが押された時の動作
                        print("OKボタンが押されました！")
                }
            )
        )
        present(alert, animated: true, completion: nil)
        
        //func textFieldShouldReturn(_textField: UITextField) -> Bool{
            //textField.resignFirstResponder()
            //return true
    }
}

