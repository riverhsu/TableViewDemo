//
//  ViewController.swift
//  TableViewDemo
//
//  Created by Sgmedical on 2016/10/18.
//  Copyright © 2016年 Sgmedical. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var avengers = ["Thor", "Iron man","Spider man", "Spider man2","black widow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    // step 1: 設定 table view 要有多少 sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
 
    // step 2: 設定一個 section 要有多少個 cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 5 
        
        //為了解決刪除新增筆數的問題，設定動態的
        return avengers.count
    }
    
    // step 3: 設定 table cells 的值
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = UITableViewCell()
        
        // single row
        // cells.textLable?.text = "single row value"
        
        // multiple rows
        cells.textLabel?.text = avengers[indexPath.row]
        return cells
    }
    
    // 使用 view controller 設定到 display view controller 的 seque
    // 在使用者按下所選的CELL 之後....
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //指定要執行的 seque name. 所以要幫每個 seque 指定 unique identifier
        //傳入 cell 的值 in sender
        performSegue(withIdentifier: "seq_goto" , sender: avengers[indexPath.row])
    }
    
    
    // prepare segue to indicate which view for displaying messages
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! SecondViewController
        
        // 因為 guest 已指定為 secndviewcontroller, 所以 guest 可以看到剛才在 secondviewcontroller 設定的 mickey ..
        // 這裹的 sender 是指觸發 seque 的任何來源
        guest.mickey = sender as! String
    }
    
    // 設定使用 swipe out 的動作
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //當使用者刪除某筆資料時
        if editingStyle == UITableViewCellEditingStyle.delete{
            //1. 刪除陣列的值
            avengers.remove(at: indexPath.row)
            //2. 刪除 table view 的值
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

