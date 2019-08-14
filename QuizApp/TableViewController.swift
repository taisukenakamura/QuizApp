//
//  TableViewController.swift
//  QuizApp
//
//  Created by 中村泰輔 on 2019/08/12.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
   var result: [Bool] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return result.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        if result[indexPath.row]{
            
            cell.textLabel?.text = "\(indexPath.row + 1)問目　⭕️"
            
        } else {
            
            cell.textLabel?.text = "\(indexPath.row + 1)問目　❌ "
            
        }
        
        return cell
    }
    


    

}
