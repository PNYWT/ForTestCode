//
//  AnnounceView.swift
//  ForTestCode
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

//MARK: Use View

class AnnounceView: UIView {

    private let screenHeight = UIScreen.main.bounds.size.height
    private let screenWidth = UIScreen.main.bounds.size.width
    private let widthsmallThanSelfWidth = UIScreen.main.bounds.size.width - 10
    
    private var vAnnounceOne: UIView! = UIView(frame: .zero)
    private var vAnnounceTwo: UIView! = UIView(frame: .zero)
    private var vAnnounceThree: UIView! = UIView(frame: .zero)
    
    private var imageBgOne = UIImageView(frame: .zero)
    private var imageBgTwo = UIImageView(frame: .zero)
    private var imageBgThree = UIImageView(frame: .zero)
    
    private var imageTreasureOne = UIImageView()
    private var imageTreasureTwo = UIImageView()
    private var imageTreasureThree = UIImageView()
    
    private var imageUserOne = UIImageView()
    private var imageUserTwo = UIImageView()
    private var imageUserThree = UIImageView()
    
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
    
    private var heightBg:CGFloat = 0.0
    private var widthBg:CGFloat = 0.0
    private var xSpace:CGFloat = 0.0
    
    private func commonInit() {
        self.backgroundColor = .clear
        //MARK: ---------------------
        vAnnounceOne = UIView(frame: CGRect(x: 0, y: 8, width: screenWidth , height: 50))
        vAnnounceOne.backgroundColor = .yellow
        self.addSubview(vAnnounceOne)
        
        heightBg = vAnnounceOne.frame.height
        widthBg = widthsmallThanSelfWidth - vAnnounceOne.frame.height
        
        imageBgOne = UIImageView(frame: CGRect(x: (vAnnounceOne.frame.width - widthBg)/2, y: 0, width: widthBg, height: heightBg))
        imageBgOne.image = UIImage(named: "bgAnnounce")
        vAnnounceOne.addSubview(imageBgOne)
        
        imageTreasureOne = UIImageView(frame: CGRect(x: imageBgOne.frame.origin.x - imageBgOne.frame.height/2 , y: (vAnnounceOne.frame.height - imageBgOne.frame.height)/2, width: imageBgOne.frame.height, height: imageBgOne.frame.height))
        imageTreasureOne.image = UIImage(named: "coin")
        vAnnounceOne.addSubview(imageTreasureOne)
        
        imageUserOne = UIImageView(frame: CGRect(x: imageTreasureOne.frame.origin.x + imageTreasureOne.frame.width, y: (imageBgOne.frame.height - (heightBg/2))/2 + 2, width: heightBg/2, height: heightBg/2))
        imageUserOne.image = UIImage(named: "coin")
        imageUserOne.contentMode = .scaleAspectFill
        imageUserOne.backgroundColor = .red
        vAnnounceOne.addSubview(imageUserOne)
        
        xSpace = imageUserOne.frame.origin.x + imageUserOne.frame.width
        lbOne = UILabel(frame: CGRect(x: xSpace, y: imageUserOne.frame.origin.y, width: imageBgOne.frame.width - xSpace, height: imageUserOne.frame.height))
        lbOne.backgroundColor = .clear
        lbOne.text = "ASL:KDJ:SALKD:LASKD:SAKD:OSAKD:LSAK:O"
        setupLabel(label: lbOne)
        vAnnounceOne.addSubview(lbOne)
        //MARK: ---------------------
        vAnnounceTwo = UIView(frame: CGRect(x: screenWidth, y: 8 + vAnnounceOne.frame.height + vAnnounceOne.frame.origin.y, width: screenWidth , height: 50))
        vAnnounceTwo.backgroundColor = .red
        self.addSubview(vAnnounceTwo)
        
        heightBg = vAnnounceTwo.frame.height
        widthBg = widthsmallThanSelfWidth - vAnnounceTwo.frame.height
        
        imageBgTwo = UIImageView(frame: CGRect(x: (vAnnounceTwo.frame.width - widthBg)/2, y: 0, width: widthBg, height: heightBg))
        imageBgTwo.image = UIImage(named: "bgAnnounce")
        vAnnounceTwo.addSubview(imageBgTwo)
        
        imageTreasureTwo = UIImageView(frame: CGRect(x: imageBgTwo.frame.origin.x - imageBgTwo.frame.height/2 , y: (vAnnounceTwo.frame.height - imageBgTwo.frame.height)/2, width: imageBgTwo.frame.height, height: imageBgTwo.frame.height))
        imageTreasureTwo.image = UIImage(named: "coin")
        vAnnounceTwo.addSubview(imageTreasureTwo)
        
        imageUserTwo = UIImageView(frame: CGRect(x: imageTreasureTwo.frame.origin.x + imageTreasureTwo.frame.width, y: (imageTreasureTwo.frame.height - (heightBg/2))/2 + 2, width: heightBg/2, height: heightBg/2))
        imageUserTwo.image = UIImage(named: "coin")
        imageUserTwo.contentMode = .scaleAspectFill
        vAnnounceTwo.addSubview(imageUserTwo)
        
        xSpace = imageUserTwo.frame.origin.x + imageUserTwo.frame.width
        lbTwo = UILabel(frame: CGRect(x: xSpace, y:imageUserTwo.frame.origin.y, width: imageBgTwo.frame.width - xSpace, height: imageUserTwo.frame.height))
        lbTwo.backgroundColor = .clear
        lbTwo.text = "ASL:KDJ:SALKD:LASKD:SAKD:OSAKD:LSAK:O"
        setupLabel(label: lbTwo)
        vAnnounceTwo.addSubview(lbTwo)
        //MARK: ---------------------
        vAnnounceThree = UIView(frame: CGRect(x: screenWidth, y: 8 + vAnnounceTwo.frame.height + vAnnounceTwo.frame.origin.y, width: screenWidth , height: 50))
        vAnnounceThree.backgroundColor = .white
        self.addSubview(vAnnounceThree)
        
        heightBg = vAnnounceThree.frame.height
        widthBg = widthsmallThanSelfWidth - vAnnounceThree.frame.height
        
        imageBgThree = UIImageView(frame: CGRect(x: (vAnnounceThree.frame.width - widthBg)/2, y: 0, width: widthBg, height: heightBg))
        imageBgThree.image = UIImage(named: "bgAnnounce")
        vAnnounceThree.addSubview(imageBgThree)
        
        imageTreasureThree = UIImageView(frame: CGRect(x: imageBgThree.frame.origin.x - imageBgThree.frame.height/2 , y: (vAnnounceThree.frame.height - imageBgThree.frame.height)/2, width: imageBgThree.frame.height, height: imageBgThree.frame.height))
        imageTreasureThree.image = UIImage(named: "coin")
        vAnnounceThree.addSubview(imageTreasureThree)
        
        imageUserThree = UIImageView(frame: CGRect(x: imageTreasureThree.frame.origin.x + imageTreasureThree.frame.width, y: (imageTreasureThree.frame.height - (heightBg/2))/2 + 2, width: heightBg/2, height: heightBg/2))
        imageUserThree.image = UIImage(named: "coin")
        imageUserThree.contentMode = .scaleAspectFill
        vAnnounceThree.addSubview(imageUserThree)
        
        xSpace = imageUserThree.frame.origin.x + imageUserThree.frame.width
        lbThree = UILabel(frame: CGRect(x: xSpace, y: imageUserThree.frame.origin.y, width: imageBgThree.frame.width - xSpace, height: imageUserThree.frame.height))
        lbThree.backgroundColor = .clear
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
