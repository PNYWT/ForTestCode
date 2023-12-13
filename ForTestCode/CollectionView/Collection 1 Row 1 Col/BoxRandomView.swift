//
//  BoxRandomView.swift
//  ForTestCode
//
//  Created by Dev on 13/12/2566 BE.
//

import UIKit

protocol BoxRandomViewDelegate{
    func doActionBoxRandom()
}

class BoxRandomView: UIView {
    
    var delegate:BoxRandomViewDelegate?

    private var btnBoxRandom = UIButton(type: .custom)
    private var labelRandom = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.backgroundColor = UIColor.red
    }
    
    func createView(){
        self.createBtn()
        self.createLabel()
    }
    
    private func createBtn(){
        let fixWidthHeight = self.frame.height*0.85
        btnBoxRandom.frame = CGRect(x: (self.frame.height - fixWidthHeight)/2, y: -10 , width: fixWidthHeight, height: fixWidthHeight)
        btnBoxRandom.backgroundColor = .green
        btnBoxRandom.setBackgroundImage(UIImage(named: "coin"), for: .normal)
        self.addSubview(btnBoxRandom)
        btnBoxRandom.addTarget(self, action: #selector(actionBoxRandom), for: .touchUpInside)
    }
    
    private func createLabel(){
        labelRandom.frame =  CGRect(x: (self.frame.height - self.frame.width)/2, y: btnBoxRandom.frame.height + btnBoxRandom.frame.origin.y, width: self.frame.width, height: self.frame.height - (btnBoxRandom.frame.height + btnBoxRandom.frame.origin.y))
        self.addSubview(labelRandom)
        labelRandom.text = "Random"
        labelRandom.textAlignment = .center
        labelRandom.textColor = .white
    }
    
    @objc func actionBoxRandom(){
        print("actionBoxRandom delegate to TopRandomBoxView")
        self.delegate?.doActionBoxRandom()
    }
}
