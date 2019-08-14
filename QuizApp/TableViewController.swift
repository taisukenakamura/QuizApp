//
//  TableViewController.swift
//  QuizApp
//
//  Created by 中村泰輔 on 2019/08/12.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    // 遷移元の正誤を受け取るための変数
    var result: [Bool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    // セルの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return result.count
    }
    // セルに代入する関数
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // trueが来た時の処理
        if result[indexPath.row]{
            cell.textLabel?.text = "\(indexPath.row + 1)問目　⭕️"
          // falseが来た時の処理
        } else {
            cell.textLabel?.text = "\(indexPath.row + 1)問目　❌ "
        }
        // 戻り値
        return cell
    }
}
