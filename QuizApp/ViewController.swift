//
//  ViewController.swift
//  QuizApp
//
//  Created by 中村泰輔 on 2019/08/12.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionTitle: UINavigationItem!
    @IBOutlet weak var questionText: UITextView!
    @IBOutlet weak var stackViewButton: UIStackView!
    
    
    // 問題データ
    let questions : [String] = [
        "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n 1. 文化遺産 2. 自然遺産 3. 山岳遺産 4. 伝統遺産",
        "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n 1. シュルレアリスム2. アバンギャルド 3. ルネサンス",
        "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。 \n 1. コパカバーナの山 2. コルコバードの丘"
         ]
    
    // 正解番号
    let answersNum : [Int] = [1,3,2]
    // 問題番号
    var questionNumber :Int = 1
    // ボタン番号総数
    var buttonTagSum : Int = 4
    // 問題カウント
    var questionsCount : Int = 0
   
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        showQuestion()
        
    }
    
   
    // 問題を表示
    func showQuestion() {
        // テキストに問題を代入
       questionText.text = questions[questionsCount]
        // タイトルに何問目か表示
       questionTitle.title = "第\(questionsCount + 1)問"
        
    }
    
    func checkAnswer(_ selectedNum : Int) {
        
        
        
        if  selectedNum == answersNum[questionsCount] {
            
            
            showCorrectAlert(title: "正解", message: "次へ進みます")
            questionsCount += 1
            hideButton()
            showQuestion()
            
          
            
        } else {
            
            showIncorrectAllert(title: "不正解", message: "次へ進みますか？")
            
        }
    
        
    }
    
    func hideButton() {
        
        
        let buttonCount :Int  =  stackViewButton.arrangedSubviews.count
        
        let hideButtonNumber : Int = buttonCount - questionNumber
        
        stackViewButton.arrangedSubviews[hideButtonNumber].isHidden = true
       
        questionNumber += 1
    }
    
    
    func reset() {
        
        
        
    }
    
   
    
    
    func showCorrectAlert(title : String? , message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
        
     }
  
    func showIncorrectAllert(title : String , message : String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let goforward = UIAlertAction(title: "OK", style: .default, handler: {  (action: UIAlertAction!) in
            
             self.hideButton()
             self.questionsCount += 1
             self.showQuestion()
            
             
            
        })
        let cancel = UIAlertAction(title: "もういちど", style: .cancel, handler: {(action: UIAlertAction!) in
            
        })
        
        alert.addAction(goforward)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showResult", let vc = segue.destination as? TableViewController else {
            return
        }
        
    }
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        
        
        
         checkAnswer(sender.tag)
        
       
        }
        
    }
    
    
    
    




