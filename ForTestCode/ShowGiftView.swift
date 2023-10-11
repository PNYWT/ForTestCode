
//
//  ShowGiftView.swift
//  LoLi
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

class ShowGiftView: UIView {

    private var rowGiftOne:ShowGiftView!
    private var rowGiftTwo:ShowGiftView!
    private var rowGiftThree:ShowGiftView!
    private var rowGiftFour:ShowGiftView!
    
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
    }
    
    func setUI(){
        rowGiftOne = ShowGiftView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 50))
        rowGiftOne.backgroundColor = .red
        self.addSubview(rowGiftOne)
    }
}

