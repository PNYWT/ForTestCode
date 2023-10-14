//
//  GiftListVC.swift
//  ForTestCode
//
//  Created by Dev on 12/10/2566 BE.
//

import UIKit

import UIKit

class GiftListVC: UIViewController {
    
    private var vList:ShowGiftView! = ShowGiftView()
    private var btnShowGift = UIButton()
    
    let gift_id = [1, 2, 3, 4]
    let user_id = ["74672890", "123456789", "987654321", "1147235"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.vList = ShowGiftView(frame: CGRect(x: 0, y: 88, width: self.view.frame.width, height: 80*4))
            self.vList.backgroundColor = .purple
            self.view.addSubview(self.vList)
        }
        
        btnShowGift = UIButton(frame: CGRect(x: (self.view.frame.width-150)/2 , y: 8 + 88 + 80*4 , width: 150, height: 50))
        self.view.addSubview(btnShowGift)
        btnShowGift.addTarget(self, action: #selector(showAction), for: .touchUpInside)
        btnShowGift.backgroundColor = .systemCyan
        btnShowGift.setTitle("Show Action", for: .normal)
    }
    
    @objc func showAction(){
        let newItem = GiftItem.init(id_gift: gift_id.randomElement()!, user_id: user_id.randomElement()!, count: 1)
        vList.runAnimate(model:newItem)
    }
}
