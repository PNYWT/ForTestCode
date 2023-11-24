//
//  ProductViewCell.swift
//  ForTestCode
//
//  Created by Dev on 23/11/2566 BE.
//

import UIKit

class ProductViewCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lbTitleProduct: UILabel!
    @IBOutlet weak var lbDescriptionProduct: UILabel!
    @IBOutlet weak var lbBrandProduct: UILabel!
    @IBOutlet weak var lbPriceProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lbTitleProduct.font = UIFont.boldSystemFont(ofSize: 16)
        lbTitleProduct.textColor = .black
        
        lbDescriptionProduct.font = UIFont.systemFont(ofSize: 14, weight: .light)
        lbDescriptionProduct.textColor = .lightGray
        
        lbBrandProduct.font = UIFont.systemFont(ofSize: 14, weight: .light)
        lbBrandProduct.textColor = .lightGray
        
        lbPriceProduct.font = UIFont.systemFont(ofSize: 14, weight: .light)
        lbPriceProduct.textColor = .lightGray
    }
    
    func setUIProduct(modelProduct:ProductModel){
        if let thumbnail = modelProduct.thumbnail{
            imgProduct.sd_setImage(with: (URL(string: "\(thumbnail)")))
        }
        
        lbTitleProduct.text = modelProduct.title
        lbDescriptionProduct.text = modelProduct.description
        lbBrandProduct.text = modelProduct.brand
        lbPriceProduct.text = String(format: "%@ $", modelProduct.price ?? "-")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
