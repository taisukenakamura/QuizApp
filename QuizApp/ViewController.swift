//
//  ViewController.swift
//  QuizApp
//
//  Created by 中村泰輔 on 2019/08/12.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 問題を代入するテキスト
    @IBOutlet weak var questionTitle: UINavigationItem!
    // 問題を代入する変数
    @IBOutlet weak var questionText: UITextView!
    // stackViewの配列
    @IBOutlet weak var stackViewButton: UIStackView!
    
    
    // 問題データ
    let questions : [[String : Any]] = [
        ["question" : "日本の世界遺産『富士山－信仰の対象と芸術の源泉』は、2013年に（ ）として世界遺産登録されました。\n 1. 文化遺産 2. 自然遺産 3. 山岳遺産 4. 伝統遺産",
         "answer" : 1],
        ["question":"イタリア共和国の世界遺産『フィレンツェの歴史地区』のあるフィレンツェを中心に、17世紀に栄えた芸術運動は何でしょうか。\n 1. シュルレアリスム2. アバンギャルド 3. ルネサンス", "answer" : 3],
        ["question": "2016年のオリンピック開催地であるリオ・デ・ジャネイロで、ブラジル独立100周年を記念して作られたキリスト像が立つ場所として、正しいものはどれか。 \n 1. コパカバーナの山 2. コルコバードの丘","answer" : 2]
    ]
    // 問題カウント
    var questionsCount : Int = 0
    // 正誤判定
    var result: [Bool] = []
    // 遷移元に戻る前の処理
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        // 遷移元のタイトル
        questionTitle.title = "問題へ"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      // 問題を表示
      showQuestion()
    }
     // 遷移から戻った時にする最初の処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // カウントの初期化
        questionsCount = 0
        // 正誤判定の初期化
        result = []
        // タイトルのリセット
       questionTitle.title = "第\(questionsCount + 1)問"
    }
    // 正誤判定関数
    func checkAnswer(_ selectedNum : Int) {
        // 問題のデータの格納
        let questionNum = questions[questionsCount]
        // 辞書型の"answer"の値がInt型か確認し格納
        if let ans = questionNum["answer"] as? Int {
            // 選んだ番号と答えの番号の正誤判断
            if selectedNum == ans {
                // 正解アラート
                showCorrectAlert()
            } else {
                // 不正解アラート
                showIncorectAlert()
            }
        } else {
            // 戻り値
            return
        }
    }
    // 問題を表示させる
    func showQuestion() {
        // 問題データの格納
        let questionNum = questions[questionsCount]
        // タイトルに代入
        questionTitle.title = "第\(questionsCount + 1)問"
        // 辞書型のquestionの値がString型か確認して格納
        if let que = questionNum["question"] as? String {
            // テキストに代入
            return questionText.text = que
        }
    }
    // ボタンを隠す関数
    func hideButton() {
        // スタックビュー内のボタンの数を取得
        let sumOfButton: Int = stackViewButton.arrangedSubviews.count
        // どのボタンを消すかを決める
        let hideButtonNumber: Int = sumOfButton - questionsCount
        // {(スタックビューの要素数) - (問題番号)}番目のボタンを隠す
        stackViewButton.arrangedSubviews[hideButtonNumber].isHidden = true
    }
    // 画面遷移前の処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 遷移先の判定
        guard segue.identifier == "showResult", let vc = segue.destination as? TableViewController else {
            return
        }
        // 結果を遷移先に代入
        vc.result = result
    }
    // 正解アラート
    func showCorrectAlert() {
        // アラートを表示
        let alert = UIAlertController(title: "正解です", message: "次へ進みますか？", preferredStyle: .alert)
        // 正解なら次の問題へ遷移
        let ok = UIAlertAction(title: "次へ", style: .default, handler: nil)
        // 最後の問題の結果表示
        let show = UIAlertAction(title: "結果へ", style: .default, handler: {(action: UIAlertAction!) in
            // 遷移の実行
            self.performSegue(withIdentifier: "showResult", sender: nil)
        })
        // 次の問題へと進む
        questionsCount += 1
        //正解の記録
        result.append(true)
        //ボタンを消去
        hideButton()
        // 問題数が配列数を超えた際
        if questionsCount >= questions.count  {
            // 結果を表示
            alert.addAction(show)
            // ボタンの再度配列
            for button in stackViewButton.arrangedSubviews {
                button.isHidden = false
            }
        // 問題数を超えない場合
        } else{
            // 次の問題へ
            alert.addAction(ok)
            showQuestion()
        }
        // 実行
        present(alert, animated: true)
    }
    // 不正解アラート
    func showIncorectAlert() {
        // アラートを表示させる
        let alert = UIAlertController(title: "不正解です", message: "次へ進みますか？", preferredStyle: .alert)
        // もう一度解き直す
        let stay = UIAlertAction(title: "もういちど", style: .cancel, handler: nil)
        // 次の問題へ
        let next = UIAlertAction(title: "次へ", style: .default, handler: {(action: UIAlertAction!) in
            // 次の問題へ
            self.questionsCount += 1
            // 問題表示
            self.showQuestion()
            // ボタンを隠す
            self.hideButton()
            // 不正解記録
            self.result.append(false)
        })
        // 結果画面への遷移
        let result = UIAlertAction(title: "結果へ", style: .default, handler: {(action: UIAlertAction!) in
            // 不正解記録
            self.result.append(false)
            // 遷移の実行
            self.performSegue(withIdentifier: "showResult", sender: nil)
        })
        // 問題数が配列の数を越す際
        if questionsCount >= questions.count - 1 {
            // 結果を表示
            alert.addAction(stay)
            alert.addAction(result)
        } else {
            // 次の問題へ
            alert.addAction(stay)
            alert.addAction(next)
            showQuestion()
        }
        // 次の問題へ配列を進める
        present(alert, animated: true, completion: nil)
    }
    // ボタンを押した際の処理
    @IBAction func tappedButton(_ sender: UIButton) {
        // tag番号を代入
        checkAnswer(sender.tag)
    }
}








