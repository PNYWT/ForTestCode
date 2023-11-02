//
//  CltvGridBtnCell.swift
//  ForTestCode
//
//  Created by Dev on 2/11/2566 BE.
//

import UIKit

class CltvGridBtnCell: UICollectionViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .white
        self.lbTitle.text = ""
    }
    
    override func prepareForReuse() {
        self.backgroundColor = .blue.withAlphaComponent(0.7)
        self.lbTitle.text = ""
        self.lbTitle.textColor = .white
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
    }
}
