//
//  ViewController.swift
//  QuizApp
//
//  Created by 中村泰輔 on 2019/08/12.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let questions : [[String : Any]] = [
        ["question" : "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n 1. 文化遺産 2. 自然遺産 3. 山岳遺産 4. 伝統遺産", "answerNum" : 1],
        ["question" : "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n 1. シュルレアリスム2. アバンギャルド 3. ルネサンス","answerNum" : 3],
        ["question" : "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。 \n 1. コパカバーナの山 2. コルコバードの丘", "answerNum" : 2]
         ]
    
    var qyestionNumber : Int = 0
    var count :Int = 0
    
    @IBOutlet weak var questionText: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    func showCorrectAlert(title : String? , message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
        
     }
  
    func showIncorrectAllert() {
        }
    
    
    @IBAction func tappedButton(_ sender: Any) {
    }
    
    
    
    


}

