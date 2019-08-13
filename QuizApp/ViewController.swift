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
    
    
    let questions : [String] = [
        "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n 1. 文化遺産 2. 自然遺産 3. 山岳遺産 4. 伝統遺産",
        "イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n 1. シュルレアリスム2. アバンギャルド 3. ルネサンス",
        "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。 \n 1. コパカバーナの山 2. コルコバードの丘"
         ]
    
    
    let answersNum : [Int] = [1,3,2]

    var questionCount :Int = 0
    var buttonTag : Int = 1
    
   
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
        
    }
    
   
    
    func showQuestion() {
        
       questionText.text = questions[questionCount]
        
       questionTitle.title = "第\(questionCount + 1)問"
        
    }
    
    func checkAnswer(_ selectedNum : Int) {
        
        
        
        if  selectedNum == answersNum[questionCount] {
            
            questionCount += 1
            showCorrectAlert(title: "正解", message: "次へ進みます")
            
            showQuestion()
            
        } else {
            
            showIncorrectAllert(title: "不正解", message: "次へ進みますか？")
            
        }
    
        
    }
    
    
    
    
    
    
    func  nextQuestion() {
        
        if questionCount < questions.count {
            
            questionCount += 1
            
        }
        
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
            
             self.questionCount += 1
             self.showQuestion()
            
        })
        let cancel = UIAlertAction(title: "もういちど", style: .cancel, handler: {(action: UIAlertAction!) in
            
        })
        
        alert.addAction(goforward)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        }
    
    
    @IBAction func tappedButton(_ sender: UIButton) {
        
         checkAnswer(sender.tag)
       
        }
        
    }
    
    
    
    




