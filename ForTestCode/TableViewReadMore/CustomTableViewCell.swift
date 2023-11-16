//
//  TableViewCell.swift
//  ForTestCode
//
//  Created by Dev on 14/11/2566 BE.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var customImageView: UIImageView!
    @IBOutlet weak var customLabel: UILabel!

    // ฟังก์ชันสำหรับการกำหนดค่า cell
    func configure(withText text: String, isExpanded: Bool) {
        customLabel.text = text
        customLabel.numberOfLines = isExpanded ? 0 : 3 // จำกัดแถวข้อความ
    }
}
