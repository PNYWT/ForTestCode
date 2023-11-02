//
//  AnimateVC.swift
//  ForTestCode
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

class AnimateVC: UIViewController {
    
    private var lbAnnounceView:LabelAnnounce! = LabelAnnounce(frame: .zero)
    private var vAnimate: AnnounceView! = AnnounceView(frame: .zero)
    private let arrText = ["Hello world this is Swift", "Hello world this is Python", "Hello world this is iPhone 15 copy paste iPhone 14 "]
    
    private var btnAnimate:UIButton! = UIButton()
    private var btnAnnounce:UIButton! = UIButton()
    private var btnShowCoin = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        btnAnnounce = UIButton(frame: CGRect(x: (self.view.frame.width - 150)/2, y: (self.view.frame.height - 150)/2, width: 150, height: 50))
        btnAnnounce.setTitleColor(.red, for: .normal)
        btnAnnounce.setTitle("Announce", for: .normal)
        self.view.addSubview(btnAnnounce)
        
        btnAnimate = UIButton(frame: CGRect(x: btnAnnounce.frame.origin.x, y: self.btnAnnounce.frame.origin.y + self.btnAnnounce.frame.height + 16, width: 150, height: 50))
        btnAnimate.setTitle("Animate", for: .normal)
        btnAnimate.setTitleColor(.orange, for: .normal)
        self.view.addSubview(btnAnimate)
        
        btnAnimate.addTarget(self, action: #selector(actionAnimate), for: .touchUpInside)
        btnAnnounce.addTarget(self, action: #selector(actionShowAnnounce), for: .touchUpInside)
        
        btnShowCoin = UIButton(frame: CGRect(x: (self.view.frame.width-150)/2 , y: btnAnimate.frame.origin.y + btnAnimate.frame.height + 8 , width: 150, height: 50))
        self.view.addSubview(btnShowCoin)
        btnShowCoin.addTarget(self, action: #selector(createCoinAnimation), for: .touchUpInside)
        btnShowCoin.backgroundColor = .cyan
        btnShowCoin.setTitle("Show Coin", for: .normal)
        
        
        vAnimate.removeFromSuperview()
        vAnimate = AnnounceView(frame: CGRect(x: 0, y: self.view.frame.height - 300, width: self.view.frame.width, height: 300))
        vAnimate.backgroundColor = .orange
        self.view.addSubview(vAnimate)
        
        lbAnnounceView.removeFromSuperview()
        lbAnnounceView = LabelAnnounce(frame: CGRect(x: 0, y: 44, width: self.view.frame.width, height: 100))
        lbAnnounceView.backgroundColor = .red
        self.view.addSubview(lbAnnounceView)
    }

    @objc func actionAnimate(){
        vAnimate.announceRun(text: arrText.randomElement()!)
    }
    
    @objc func actionShowAnnounce(){
        lbAnnounceView.setLbandRun(textShow: arrText.randomElement()!)
    }
    
    
    @objc func createCoinAnimation() {
        let coinSizeRange = 25...50
        let numberOfCoins = 50
        
        for _ in 0..<numberOfCoins {
            let randomSize = CGFloat.random(in: CGFloat(coinSizeRange.lowerBound)..<(CGFloat(coinSizeRange.upperBound) + 1))
            let coinSize = CGSize(width: randomSize, height: randomSize)
            let coinView = UIImageView()
            coinView.image = UIImage(named: "coin")
            coinView.frame = CGRect(x: view.center.x - coinSize.width / 2, y: view.frame.height, width: coinSize.width, height: coinSize.height)
            coinView.backgroundColor = UIColor.yellow
            coinView.layer.cornerRadius = coinSize.width / 2
            view.addSubview(coinView)
            
            let duration = Double.random(in: 1.0...2.0) // สุ่มระยะเวลา
            let delay = Double.random(in: 0.0...1)  // สุ่มความล่าช้า
            coinView.frame.origin.y = view.frame.height
            
            UIView.animate(withDuration: duration, delay: delay, options: .curveEaseOut, animations: {
                coinView.frame.origin.y = self.view.frame.height/1.5 // พุ่งขึ้น
                let test = coinView.frame.origin.x
                coinView.frame.origin.x = Double.random(in: test...test+100)
            }) { (completed) in
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn, animations: {
                    coinView.frame.origin.y = self.view.frame.height // พุ่งลง
                    let test = self.view.frame.width
                    coinView.frame.origin.x = Double.random(in: test-100...test)
                    coinView.transform = CGAffineTransform(rotationAngle: 100)
            
                }) { (completed) in
                    coinView.removeFromSuperview()
                }
            }
        }
    }
}
