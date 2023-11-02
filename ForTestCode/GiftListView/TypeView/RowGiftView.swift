//
//  RowGiftView.swift
//  ForTestCode
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

class RowGiftView: UIView {

    @IBOutlet weak var vNib:UIView!
    
    @IBOutlet weak var vDataContent: UIView!
    @IBOutlet weak var imgGift: UIImageView!
    @IBOutlet weak var lbUsername: UILabel!
    @IBOutlet weak var lbUserId: UILabel!
    @IBOutlet weak var lbCountGift: UILabel!
    
    @IBOutlet weak var vBigJackpot: UIView!
    
    @IBOutlet weak var vSuperJackpot: UIView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .clear
        Bundle.main.loadNibNamed("RowGiftView", owner: self, options: nil)
        addSubview(vNib)
        vNib.frame = self.bounds
        vNib.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
    func showUI(model:GiftItem){
        if let name = model.user_name{
            lbUsername.text = name
        }
        
        if let id = model.user_id{
            lbUserId.text = "id: \(id)"
        }
        
        if let count = model.count{
            lbCountGift.text = String(format: "x%d", count)
        }
    }
}
