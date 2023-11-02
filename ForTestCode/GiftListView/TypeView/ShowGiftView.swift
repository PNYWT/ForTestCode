
//
//  ShowGiftView.swift
//  ForTestCode
//
//  Created by Dev on 11/10/2566 BE.
//

import UIKit

struct GiftItem {
    var id_gift: Int? = nil
    var user_id: String? = nil
    var user_name: String? = nil
    var count: Int? = nil
    var timeAdd: Double = Date().timeIntervalSince1970
    
    init(id_gift:Int? = nil, user_id:String? = nil, user_name:String? = nil, count: Int? = nil) {
        self.user_name = user_name
        self.id_gift = id_gift
        self.user_id = user_id
        self.timeAdd = Date().timeIntervalSince1970 + 6
        self.count = count
    }
}

class ShowGiftView: UIView {

    private var rowGiftOne:RowGiftView!
    private var rowGiftTwo:RowGiftView!
    private var rowGiftThree:RowGiftView!
    private var rowGiftFour:RowGiftView!
    
    private var havePauseOne = true
    private var havePauseTwo = true
    private var havePauseThree = true
    private var havePauseFour = true
    
    var itemsOne = GiftItem()
    var itemsTwo = GiftItem()
    var itemsThree = GiftItem()
    var itemsFour = GiftItem()
    var timerGiftRemove: Timer?
    private let myTableViewCell = "myTableViewCell"
    
    let user_name = ["MR.A1", "MS.B2", "Mr.C3", "MS.C4"]
    
    private var timeIntervalSince1970 = Double()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        self.backgroundColor = .blue
        
        rowGiftOne = RowGiftView(frame: CGRect(x: -self.frame.width, y: 0, width: self.frame.width, height: 80))
        self.addSubview(rowGiftOne)
        
        rowGiftTwo = RowGiftView(frame: CGRect(x: -self.frame.width, y: rowGiftOne.frame.height + rowGiftOne.frame.origin.y, width: self.frame.width, height: 80))
        self.addSubview(rowGiftTwo)
        
        rowGiftThree = RowGiftView(frame: CGRect(x: -self.frame.width, y: rowGiftTwo.frame.height + rowGiftTwo.frame.origin.y, width: self.frame.width, height: 80))
        self.addSubview(rowGiftThree)
        
        rowGiftFour = RowGiftView(frame: CGRect(x: -self.frame.width, y: rowGiftThree.frame.height + rowGiftThree.frame.origin.y, width: self.frame.width, height: 80))
        self.addSubview(rowGiftFour)
        
        timerGiftRemove = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { [weak self] _ in
            self?.timeIntervalSince1970 = Date().timeIntervalSince1970 + 6
            self?.checkAndUpdateData()
        }
    }
    
    //MARK: runAnimate
    func runAnimate(model:GiftItem){
        print("userID -> \(model.user_id), TimeAdd -> \(model.timeAdd)")
        //MARK: One
        if havePauseOne{
            self.havePauseOne = false
            rowGiftOne.transform = .identity
            self.itemsOne = model
            self.itemsOne.user_name = user_name[0]
            rowGiftOne.showUI(model: self.itemsOne)
            UIView.animate(withDuration: 1) {
                self.rowGiftOne.alpha = 1
                self.rowGiftOne.layer.speed = 1
                self.rowGiftOne.transform = CGAffineTransform(translationX: self.frame.width, y: 0)
            }
            animateCoinsBurst(count: 50)
            return
        }else{
            if model.user_id == self.itemsOne.user_id && model.id_gift == itemsOne.id_gift{
                let count = model.count! + itemsOne.count!
                self.itemsOne = model
                self.itemsOne.count = count
                self.itemsOne.user_name = user_name[0]
                itemsOne.timeAdd = timeIntervalSince1970
                rowGiftOne.showUI(model: self.itemsOne)
                self.havePauseOne = false
                return
            }
        }
        
        //MARK: Two
        if havePauseTwo{
            self.havePauseTwo = false
            rowGiftTwo.transform = .identity
            self.itemsTwo = model
            self.itemsTwo.user_name = user_name[1]
            rowGiftTwo.showUI(model: self.itemsTwo)
            UIView.animate(withDuration: 1) {
                self.rowGiftTwo.alpha = 1
                self.rowGiftTwo.layer.speed = 1
                self.rowGiftTwo.transform = CGAffineTransform(translationX: self.frame.width, y: 0)
            }
            return
        }else{
            if model.user_id == self.itemsTwo.user_id && model.id_gift == itemsTwo.id_gift{
                let count = model.count! + itemsTwo.count!
                itemsTwo = model
                itemsTwo.count = count
                itemsTwo.timeAdd = timeIntervalSince1970
                self.itemsTwo.user_name = user_name[1]
                rowGiftTwo.showUI(model: self.itemsTwo)
                self.havePauseTwo = false
                return
            }
        }
        
        //MARK: Three
        if havePauseThree{
            self.havePauseThree = false
            rowGiftThree.transform = .identity
            self.itemsThree = model
            self.itemsThree.user_name = user_name[2]
            rowGiftThree.showUI(model: self.itemsThree)
            UIView.animate(withDuration: 1) {
                self.rowGiftThree.alpha = 1
                self.rowGiftThree.layer.speed = 1
                self.rowGiftThree.transform = CGAffineTransform(translationX: self.frame.width, y: 0)
            }
            return
        }else{
            if model.user_id == self.itemsThree.user_id && model.id_gift == itemsThree.id_gift{
                let count = model.count! + itemsThree.count!
                itemsThree = model
                itemsThree.count = count
                itemsThree.timeAdd = timeIntervalSince1970
                itemsThree.user_name = user_name[2]
                rowGiftThree.showUI(model: self.itemsThree)
                self.havePauseThree = false
                return
            }
        }
        
        //MARK: Four
        if havePauseFour{
            self.havePauseFour = false
            rowGiftFour.transform = .identity
            itemsFour = model
            itemsFour.user_name = user_name[3]
            rowGiftFour.showUI(model: itemsFour)
            UIView.animate(withDuration: 1) {
                self.rowGiftFour.alpha = 1
                self.rowGiftFour.layer.speed = 1
                self.rowGiftFour.transform = CGAffineTransform(translationX: self.frame.width, y: 0)
            }
            return
        }else{
            if model.user_id == self.itemsFour.user_id && model.id_gift == itemsFour.id_gift{
                let count = model.count! + itemsFour.count!
                self.itemsFour = model
                itemsFour.count = count
                itemsFour.timeAdd = timeIntervalSince1970
                itemsFour.user_name = user_name[3]
                rowGiftFour.showUI(model: self.itemsFour)
                self.havePauseFour = false
                return
            }
        }
    }
    
    //MARK: checkAndUpdateData
    func checkAndUpdateData() {
        let currentTime = Date().timeIntervalSince1970
        let diffTime:Double = 3
        
        
        //MARK: One
        if (currentTime - itemsOne.timeAdd) > diffTime{
//            print("Diff one -> \(currentTime - itemsOne.timeAdd)")
            if !havePauseOne{
//                print("remove One -> \(currentTime)")
                itemsOne = GiftItem()
                havePauseOne = true
                UIView.animate(withDuration: 0.5) {
                    self.rowGiftOne.alpha = 0
                }
                return
            }
        }

        //MARK: Two
        if (currentTime - itemsTwo.timeAdd) > diffTime{
//            print("Diff two -> \(currentTime - itemsTwo.timeAdd)")
            if !havePauseTwo{
//                print("remove Two -> \(currentTime)")
                itemsTwo = GiftItem()
                havePauseTwo = true
                UIView.animate(withDuration: 0.5) {
                    self.rowGiftTwo.alpha = 0
                }
                return
            }
        }
        
        //MARK: Three
        if (currentTime - itemsThree.timeAdd) > diffTime{
//            print("Diff three -> \(currentTime - itemsThree.timeAdd)")
            if !havePauseThree{
//                print("remove Three -> \(currentTime)")
                itemsThree = GiftItem()
                havePauseThree = true
                UIView.animate(withDuration: 0.5) {
                    self.rowGiftThree.alpha = 0
                }
                return
            }
        }
        
        //MARK: Four
        if (currentTime - itemsFour.timeAdd) > diffTime{
//            print("Diff four -> \(currentTime - itemsFour.timeAdd)")
            if !havePauseFour{
//                print("remove four -> \(currentTime)")
                itemsFour = GiftItem()
                havePauseFour = true
                UIView.animate(withDuration: 1.5) {
                    self.rowGiftFour.alpha = 0
                }
                return
            }
        }
    }
    
    private func animateCoinsBurst(count:Int) {
        let numberOfCoins = count
        let coinSizeRange = 25...50
        let speedRange = 0.5...2.0

        for _ in 0..<numberOfCoins {
            let randomSize = CGFloat.random(in: CGFloat(coinSizeRange.lowerBound)..<(CGFloat(coinSizeRange.upperBound) + 1))
            let coinSize = CGSize(width: randomSize, height: randomSize)
            let coinImageView = UIImageView(frame: CGRect(x: rowGiftOne.frame.midX - coinSize.width / 2, y: rowGiftOne.frame.maxY - coinSize.height, width: coinSize.width, height: coinSize.height))
            coinImageView.image = UIImage(named: "coin") // เปลี่ยนเป็นชื่อรูปภาพของเหรียญที่คุณใช้
            self.addSubview(coinImageView)
            self.bringSubviewToFront(coinImageView)

            let randomX = CGFloat.random(in: UIScreen.main.bounds.minX...UIScreen.main.bounds.maxX)
            let calY = UIScreen.main.bounds.maxY
            let randomY = CGFloat.random(in: -calY/2...calY/2)

            let randomSpeed = Double.random(in: speedRange)

            UIView.animate(withDuration: randomSpeed, animations: {
                // กำหนดตำแหน่งที่เหรียญจะพุ่งขึ้นไปยังตำแหน่งสุ่มบนจอ
                coinImageView.frame.origin = CGPoint(x: randomX, y: randomY)
                
            }) { (completed) in
                UIView.animate(withDuration: randomSpeed, animations: {
                    // กำหนดตำแหน่งที่เหรียญจะตกลงมา
                    coinImageView.frame.origin = CGPoint(x: UIScreen.main.bounds.width, y: UIScreen.main.bounds.height + coinSize.height)
                    
                }) { (completed) in
                    coinImageView.removeFromSuperview()
                }
            }
        }
    }
}

