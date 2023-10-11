//
//  AnnounceView.swift
//  Test
//
//  Created by Dev on 10/10/2566 BE.
//

import UIKit
import MarqueeLabel

class LabelAnnounce: UIView {

    @IBOutlet var vNib: UIView!
    
    @IBOutlet weak var lb1: MarqueeLabel!
    @IBOutlet weak var lb2: MarqueeLabel!
    @IBOutlet weak var lb3: MarqueeLabel!
    
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
        Bundle.main.loadNibNamed("LabelAnnounce", owner: self, options: nil)
        addSubview(vNib)
        vNib.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vNib.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            vNib.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            vNib.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            vNib.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
        vNib.backgroundColor = .clear
        lb1.textColor = .green
        lb1.type = .continuousReverse
        lb1.fadeLength = 8.0
        lb1.speed = .duration(8)
        lb1.animationCurve = .linear
        lb1.type = .continuous
        lb1.textAlignment = .left
        lb1.leadingBuffer = self.frame.width
        lb1.trailingBuffer = self.frame.width
        lb2.textColor = .blue
        lb2.type = .left
        lb2.fadeLength = 8.0
        lb2.speed = .duration(8)
        lb2.animationCurve = .linear
        lb2.type = .continuous
        lb2.textAlignment = .left
        lb2.leadingBuffer = self.frame.width
        lb2.trailingBuffer = self.frame.width
        lb3.type = .left
        lb3.fadeLength = 8.0
        lb3.speed = .duration(8)
        lb3.animationCurve = .linear
        lb3.type = .continuous
        lb3.textAlignment = .left
        lb3.leadingBuffer = self.frame.width
        lb3.trailingBuffer = self.frame.width
        
        lb1.labelize = true
        lb2.labelize = true
        lb3.labelize = true
    }
    
    
    func setLbandRun(textShow:String){
        if  lb1.labelize {
            lb1.labelize = false
            self.perform(#selector(stopLb1), with: nil, afterDelay: 9)
            return
        }

        if  lb2.labelize {
            lb2.labelize = false
            
            self.perform(#selector(stopLb2), with: nil, afterDelay: 9)
            return
        }

        if  lb3.labelize {
            lb3.labelize = false
            
            self.perform(#selector(stopLb3), with: nil, afterDelay: 9)
            return
        }
    }
    
    @objc func stopLb1(){
        lb1.labelize = true
    }
    
    @objc func stopLb2(){
        lb2.labelize = true
    }
    
    @objc func stopLb3(){
        lb3.labelize = true
    }
}
