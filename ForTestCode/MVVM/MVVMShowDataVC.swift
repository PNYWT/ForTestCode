//
//  MVVMShowDataVC.swift
//  ForTestCode
//
//  Created by Dev on 22/11/2566 BE.
//

class ConfigApp{
    static let showLog = true
}

import Foundation
import UIKit

class MVVMShowDataVC:UIViewController{
    
    private var productManagement:ProductViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray.withAlphaComponent(0.7)
        setUI()
    }
    
    private func setUI(){
        productManagement = ProductViewModel()
        productManagement.setUI(viewController: self)
        productManagement.getProduct { setupUI in
            if setupUI{
                DispatchQueue.main.async {
                    self.productManagement.productTable.reloadData()
                }
            }else{
                
            }
        }
    }
}
