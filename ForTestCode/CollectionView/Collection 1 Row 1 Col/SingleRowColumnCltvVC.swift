//
//  SingleRowColumnCltvVC.swift
//  ForTestCode
//
//  Created by Dev on 13/12/2566 BE.
//

import Foundation
import UIKit

class SingleRowColumnCltvVC:UIViewController{
    
    let vTopRandomBox = TopRandomBoxView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        
        vTopRandomBox.frame = CGRect(x: 0, y: self.getNavigationBarOriginalY() + self.getNavigationBarHeight(), width: self.view.frame.width, height: 70)
        self.view.addSubview(vTopRandomBox)
        vTopRandomBox.createView()
    }
}
