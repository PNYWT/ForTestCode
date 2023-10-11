//
//  ViewController.swift
//  Test
//
//  Created by Dev on 15/8/2566 BE.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btnAnimate: UIButton!
    @IBOutlet weak var btnGiftList: UIButton!
    @IBOutlet weak var btnCointBurst: UIButton!
    @IBOutlet weak var openTableView: UIButton!
    @IBOutlet weak var popOver: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        openTableView.addTarget(self, action: #selector(actionTableView), for: .touchUpInside)
        btnCointBurst.addTarget(self, action: #selector(animateCoinsBurst), for: .touchUpInside)
        
        btnAnimate.addTarget(self, action: #selector(actionAnimate), for: .touchUpInside)
        btnGiftList.addTarget(self, action: #selector(gotoGiftList), for: .touchUpInside)
    }
    
    @objc func gotoGiftList(){
        let vc = GiftListVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func actionAnimate(){
        let vc = AnimateVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func actionTableView(){
        let vc = TableViewVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func animateCoinsBurst() {
        let numberOfCoins = 50 // จำนวนเหรียญที่คุณต้องการให้พุ่ง
        let coinSize = CGSize(width: 50, height: 50)
        
        for _ in 0..<numberOfCoins {
            let coinImageView = UIImageView(frame: CGRect(x: 0, y: self.view.frame.height - coinSize.height, width: coinSize.width, height: coinSize.height))
            coinImageView.image = UIImage(named: "coin") // เปลี่ยนเป็นชื่อรูปภาพของเหรียญที่คุณใช้
            self.view.addSubview(coinImageView)
            
            let randomX = CGFloat.random(in: 0...(self.view.frame.width - coinSize.width))
            let randomY = CGFloat.random(in: 0...(self.view.frame.height - coinSize.height))
            
            UIView.animate(withDuration: 0.5, animations: {
                // กำหนดตำแหน่งที่เหรียญจะพุ่งขึ้น
                coinImageView.frame.origin = CGPoint(x: randomX, y: randomY)
                
            }) { (completed) in
                UIView.animate(withDuration: 0.5, animations: {
                    // กำหนดตำแหน่งที่เหรียญจะตกลงมา
                    coinImageView.frame.origin = CGPoint(x: randomX, y: self.view.frame.height - coinSize.height)
                    
                }) { (completed) in
                    coinImageView.removeFromSuperview()
                }
            }
        }
    }
    
    @IBAction func showPopover(_ sender: UIButton) {
        let popoverContent = PopoverViewController(infoText: "Username must be between 3-20 and can only consist of alphanumeric characters.")
        presentPopover(self, popoverContent, sender: popOver, size: CGSize(width: 315, height: 120), arrowDirection: .down)
    }
}



