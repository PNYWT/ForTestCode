//
//  GiftBoxViewCell.swift
//  ForTestCode
//
//  Created by Dev on 14/12/2566 BE.
//

import UIKit

class GiftBoxViewCell: UICollectionViewCell {

    @IBOutlet weak var imgGift: UIImageView!
    @IBOutlet weak var vDetailGift: UIView!
    @IBOutlet weak var imgC: UIImageView!
    @IBOutlet weak var lbC: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vDetailGift.layer.cornerRadius = 8
        vDetailGift.backgroundColor = .black
        
        lbC.textColor = .white
    }
    
    
    func setView(){
        
    }
}
