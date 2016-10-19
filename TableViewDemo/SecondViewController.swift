//
//  SecondViewController.swift
//  TableViewDemo
//  
//
//  1. Transfer string from table view to this second view
//  2. Drag segue from first view controller to second view

import UIKit

class SecondViewController: UIViewController {
    

    @IBOutlet weak var textLabel: UILabel!
    
    var mickey = "River"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = mickey
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
