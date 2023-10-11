//
//  GiftListVC.swift
//  ForTestCode
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

class GiftListVC: UIViewController {
    
    private var vList:ShowGiftView! = ShowGiftView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        vList = ShowGiftView(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: self.view.frame.width))
        vList.backgroundColor = .purple
        vList.setUI()
        self.view.addSubview(vList)
    }
}
