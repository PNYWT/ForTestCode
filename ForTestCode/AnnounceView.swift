//
//  AnnounceView.swift
//  Test
//
//  Created by Dev on 10/10/2566 BE.
//

import UIKit

class AnnounceView: UIView {

    @IBOutlet var vNib: UIView!
    
    
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
        Bundle.main.loadNibNamed("AnnounceView", owner: self, options: nil)
        addSubview(vNib)
        vNib.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vNib.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            vNib.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            vNib.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            vNib.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
        vNib.backgroundColor = .clear
    }
}
