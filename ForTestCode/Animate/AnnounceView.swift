//
//  AnnounceView.swift
//  ForTestCode
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

class AnnounceView: UIView {

    private let screenHeight = UIScreen.main.bounds.size.height
    private let screenWidth = UIScreen.main.bounds.size.width
    private let widthsmallThanSelfWidth = UIScreen.main.bounds.size.width - 10
    
    private var vAnnounceOne: UIView! = UIView(frame: .zero)
    private var vAnnounceTwo: UIView! = UIView(frame: .zero)
    private var vAnnounceThree: UIView! = UIView(frame: .zero)
    
    private var imageOne = UIImageView(frame: .zero)
    private var imageTwo = UIImageView(frame: .zero)
    private var imageThree = UIImageView(frame: .zero)
    
    private var lbOne = UILabel(frame: .zero)
    private var lbTwo = UILabel(frame: .zero)
    private var lbThree = UILabel(frame: .zero)
    
    private var havePauseOne = true
    private var havePauseTwo = true
    private var havePauseThree = true
    
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
        //MARK: ---------------------
        vAnnounceOne = UIView(frame: CGRect(x: screenWidth, y: 8, width: screenWidth , height: 50))
        vAnnounceOne.backgroundColor = .yellow
        self.addSubview(vAnnounceOne)
        
        imageOne = UIImageView(frame: CGRect(x: (screenWidth - widthsmallThanSelfWidth)/2, y: 5, width: widthsmallThanSelfWidth, height: vAnnounceOne.frame.height - 10))
        imageOne.image = UIImage(named: "bgAnnounce")
        vAnnounceOne.addSubview(imageOne)
        
        lbOne = UILabel(frame: CGRect(x: imageOne.frame.origin.x + 5, y: ((imageOne.frame.height - 10) - imageOne.frame.origin.y)/2 , width: imageOne.frame.width - 20 , height:  imageOne.frame.height - 10))
        lbOne.text = "ASL:KDJ:SALKD:LASKD:SAKD:OSAKD:LSAK:O"
        setupLabel(label: lbOne)
        vAnnounceOne.addSubview(lbOne)
        //MARK: ---------------------
        vAnnounceTwo = UIView(frame: CGRect(x: screenWidth, y: 8 + vAnnounceOne.frame.height + vAnnounceOne.frame.origin.y, width: screenWidth , height: 50))
        vAnnounceTwo.backgroundColor = .red
        self.addSubview(vAnnounceTwo)
        
        imageTwo = UIImageView(frame: CGRect(x: 5, y: 5, width: widthsmallThanSelfWidth, height: vAnnounceTwo.frame.height - 10))
        imageTwo.image = UIImage(named: "bgAnnounce")
        vAnnounceTwo.addSubview(imageTwo)
        
        lbTwo = UILabel(frame: CGRect(x: imageTwo.frame.origin.x + 5, y: ((imageTwo.frame.height - 10) - imageTwo.frame.origin.y)/2 , width: imageTwo.frame.width - 20 , height:  imageTwo.frame.height - 10))
        lbTwo.text = "ASL:KDJ:SALKD:LASKD:SAKD:OSAKD:LSAK:O"
        setupLabel(label: lbTwo)
        vAnnounceTwo.addSubview(lbTwo)
        //MARK: ---------------------
        vAnnounceThree = UIView(frame: CGRect(x: screenWidth, y: 8 + vAnnounceTwo.frame.height + vAnnounceTwo.frame.origin.y, width: screenWidth , height: 50))
        vAnnounceThree.backgroundColor = .white
        self.addSubview(vAnnounceThree)
        
        imageThree = UIImageView(frame: CGRect(x: 5, y: 5, width: widthsmallThanSelfWidth, height: vAnnounceThree.frame.height - 10))
        imageThree.image = UIImage(named: "bgAnnounce")
        vAnnounceThree.addSubview(imageThree)
        
        lbThree = UILabel(frame: CGRect(x: imageThree.frame.origin.x + 5, y: ((imageThree.frame.height - 10) - imageThree.frame.origin.y)/2 , width: imageThree.frame.width - 20 , height:  imageThree.frame.height - 10))
        lbThree.text = "ASL:KDJ:SALKD:LASKD:SAKD:OSAKD:LSAK:O"
        setupLabel(label: lbThree)
        vAnnounceThree.addSubview(lbThree)
    }
    
    
    private func setupLabel(label:UILabel){
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
    }
    
    func announceRun(text:String){
        if havePauseOne{
            self.havePauseOne = false
            lbOne.text = text
            vAnnounceOne.transform = .identity
            UIView.animate(withDuration: 4) {
                self.vAnnounceOne.layer.speed = 1
                self.vAnnounceOne.transform = CGAffineTransform(translationX: -self.vAnnounceOne.frame.width*2, y: 0)
            } completion: { check in
                if check{
                    self.havePauseOne = true
                }
            }
            return
        }
        
        if havePauseTwo{
            self.havePauseTwo = false
            lbTwo.text = text
            vAnnounceTwo.transform = .identity
            UIView.animate(withDuration: 4) {
                self.vAnnounceTwo.layer.speed = 1
                self.vAnnounceTwo.transform = CGAffineTransform(translationX: -self.vAnnounceOne.frame.width*2, y: 0)
            } completion: { check in
                if check{
                    self.havePauseTwo = true
                }
            }
            return
        }
        
        if havePauseThree{
            self.havePauseThree = false
            lbThree.text = text
            vAnnounceThree.transform = .identity
            UIView.animate(withDuration: 4) {
                self.vAnnounceThree.layer.speed = 1
                self.vAnnounceThree.transform = CGAffineTransform(translationX: -self.vAnnounceOne.frame.width*2, y: 0)
            } completion: { check in
                if check{
                    self.havePauseThree = true
                }
            }
            return
        }
        
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 5) {
            self.announceRun(text: text)
        }
    }

    
    func pauseLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
    }

    func resumeLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.timeOffset
        layer.speed = 1.0
        layer.timeOffset = 0.0
        layer.beginTime = 0.0
        let timeSincePause: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        layer.beginTime = timeSincePause
    }
}
