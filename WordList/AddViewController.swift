//
//  AddViewController.swift
//  WordList
//
//  Created by MASANAO on 2022/05/13.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        if saveData.array (forKey: "WORD") != nil {
            wordArray = saveData.array (forKey: "WORD") as! [Dictionary<String, String>]
        }
                           
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveWord() {
        if englishTextField.text == "" {
            let einglishNilAlert = UIAlertController(
                title:"エラー",
                message: "英語がが空欄になっています",
                preferredStyle: .alert
            )
            einglishNilAlert.addAction (UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present (einglishNilAlert, animated: true, completion: nil)
        } else if japaneseTextField.text == "" {
            let einglishNilAlert = UIAlertController(
                title:"エラー",
                message: "日本語がが空欄になっています",
                preferredStyle: .alert
            )
            einglishNilAlert.addAction (UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present (einglishNilAlert, animated: true, completion: nil)
        } else {
            let wordDictionary = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
            
            wordArray.append (wordDictionary)
            saveData.set (wordArray, forKey: "WORD")
            
            let alert = UIAlertController(
                title:"保存完了",
                message: "単語の登録が完了しました",
                preferredStyle: .alert
            )
            alert.addAction (UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present (alert, animated: true, completion: nil)
            englishTextField.text = ""
            japaneseTextField.text = ""
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
