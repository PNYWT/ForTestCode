//
//  AnimateVC.swift
//  ForTestCode
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

class AnimateVC: UIViewController {
    
    private var announceView:LabelAnnounce! = LabelAnnounce(frame: .zero)
    private var vAnimate: AnnounceView! = AnnounceView(frame: .zero)
    private let arrText = ["Hello world this is Swift", "Hello world this is Python", "Hello world this is iPhone 15 copy paste iPhone 14 "]
    
    private var btnAnimate:UIButton! = UIButton()
    private var btnAnnounce:UIButton! = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        btnAnnounce = UIButton(frame: CGRect(x: (self.view.frame.width - 150)/2, y: (self.view.frame.height - 50)/2, width: 150, height: 50))
        btnAnnounce.setTitleColor(.red, for: .normal)
        btnAnnounce.setTitle("Announce", for: .normal)
        self.view.addSubview(btnAnnounce)
        
        btnAnimate = UIButton(frame: CGRect(x: btnAnnounce.frame.origin.x, y: self.btnAnnounce.frame.origin.y + self.btnAnnounce.frame.height + 16, width: 150, height: 50))
        btnAnimate.setTitle("Animate", for: .normal)
        btnAnimate.setTitleColor(.orange, for: .normal)
        self.view.addSubview(btnAnimate)
        
        btnAnimate.addTarget(self, action: #selector(actionAnimate), for: .touchUpInside)
        btnAnnounce.addTarget(self, action: #selector(actionShowAnnounce), for: .touchUpInside)
        
        
        vAnimate.removeFromSuperview()
        vAnimate = AnnounceView(frame: CGRect(x: 0, y: self.view.frame.height - 300, width: self.view.frame.width, height: 300))
        vAnimate.backgroundColor = .orange
        self.view.addSubview(vAnimate)
        
        announceView.removeFromSuperview()
        announceView = LabelAnnounce(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: 100))
        announceView.backgroundColor = .red
        self.view.addSubview(announceView)
    }

    @objc func actionAnimate(){
        vAnimate.announceRun(text: arrText.randomElement()!)
    }
    
    @objc func actionShowAnnounce(){
        announceView.setLbandRun(textShow: arrText.randomElement()!)
    }
    
}
