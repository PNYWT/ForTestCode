//
//  PresentVC.swift
//  Test
//
//  Created by Dev on 22/9/2566 BE.
//

import UIKit

class PresentVC: UIViewController {
    
    private var closeBtn:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .red
        closeBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        closeBtn.center = self.view.center
        closeBtn.setTitle("close Page", for: .normal)
        closeBtn.setTitleColor(.red, for: .normal)
        self.view.addSubview(closeBtn)
        
        closeBtn.addTarget(self, action: #selector(closePage), for: .touchUpInside)
        
        
        view.backgroundColor = UIColor(white: 0, alpha: 0.5) // Semi-transparent background
        
        let label = UILabel(frame: CGRect(x: (self.view.frame.width - 200)/2, y: closeBtn.frame.origin.y + closeBtn.frame.height + 16, width: 200, height: 40))
        label.text = "Modal Content"
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        label.adjustsFontSizeToFitWidth = true
    }
    
    @objc func closePage(){
        self.dismiss(animated: true)
    }
}
