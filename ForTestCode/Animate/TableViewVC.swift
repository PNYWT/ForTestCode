//
//  TableViewVC.swift
//  Test
//
//  Created by Dev on 10/10/2566 BE.
//

import UIKit

class TableViewVC: UIViewController {
    
    @IBOutlet weak var tbv: TableViewCenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        tbv.addItemByBtn()
    }
}
