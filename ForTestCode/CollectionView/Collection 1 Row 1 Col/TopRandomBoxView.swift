//
//  TopRandomBox.swift
//  ForTestCode
//
//  Created by Dev on 13/12/2566 BE.
//

import UIKit

class TopRandomBoxView: UIView {
    
    var vBoxRandom = BoxRandomView()
    var cltvSingle:SingleRowColumnCltv = SingleRowColumnCltv(frame: .zero, isHorizontal: true)
    var vAnimation:AnimationRandomBoxView = AnimationRandomBoxView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.blue
    }
    
    func createView(){
        self.createBoxRandomView()
        self.createCltvGiftRandom()
    }
    
    private func createBoxRandomView(){
        vBoxRandom.delegate = self
        vBoxRandom.frame = CGRect(x: 0, y: 0, width: self.frame.height, height: self.frame.height)
        self.addSubview(vBoxRandom)
        vBoxRandom.createView()
    }
    
    private func createCltvGiftRandom(){
        cltvSingle = SingleRowColumnCltv(frame: CGRect(x: vBoxRandom.frame.width, y: 0, width: self.frame.width - vBoxRandom.frame.width, height: self.frame.height), isHorizontal: true)
        self.addSubview(cltvSingle)
        cltvSingle.reloadData()
    }
}

extension TopRandomBoxView:BoxRandomViewDelegate{
    func doActionBoxRandom() {
        print("action Somthing in TopRandomBoxView")
        vAnimation = AnimationRandomBoxView(frame: CGRect(x: -(UIScreen.main.bounds.width + 300), y: (UIScreen.main.bounds.height - (300*2))/2, width: 300, height: 300))
        vAnimation.creatViewContentAndShowAnimation(addToView:self)
    }
}
