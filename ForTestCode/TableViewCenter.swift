import UIKit

struct Item {
    let id_gift: Int
    let user_id: String
    var value: Double
    var count: Int
}

class TableViewCenter: UITableView {
    
    var items = [Item]()
    let idTest = [1, 2, 3]
    let userTest = ["A1", "B2", "C3"]
    var timer: Timer?
    private let myTableViewCell = "myTableViewCell"
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    
    func setupUI() {
        self.delegate = self
        self.dataSource = self
        self.layer.masksToBounds = false
        self.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: myTableViewCell)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.checkAndUpdateData()
        }
        
        self.backgroundColor = .red
    }
    
    func checkAndUpdateData() {
        let currentTime = Date().timeIntervalSince1970
        let updatedItems = items.filter { currentTime - Double($0.value) < 5.00 }
        
        if items.count != updatedItems.count {
            items = updatedItems
            self.reloadData()
        }
    }
    
     func addItem(item: Item) {
         if let existingIndex = items.firstIndex(where: { $0.id_gift == item.id_gift && $0.user_id == item.user_id }) {
             let oldCount = items[existingIndex].count
             items[existingIndex].value = Date().timeIntervalSince1970 + 2
             items[existingIndex].count += 1
             let updatedItem = items.remove(at: existingIndex)
             items.insert(updatedItem, at: 0)
             let newCount = items[existingIndex].count
             
             if newCount != oldCount {
                 animateCoinsBurst(fromCellAt:  IndexPath(row: existingIndex, section: 0))
             }
         } else {
             if items.count < 4 {
                 items.append(item)
             }else{
                 items.removeLast(items.count - 4)
             }
         }
         
         self.reloadData()
     }
     
    
    
    func addItemByBtn() {
        let newItem = Item(id_gift: idTest.randomElement()!, user_id: userTest.randomElement()!, value: Date().timeIntervalSince1970, count: 1)
        addItem(item: newItem)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    @objc func animateCoinsBurst(fromCellAt indexPath: IndexPath) {
        let numberOfCoins = 25
        let coinSizeRange = 25...50
        let speedRange = 0.5...2.0

        if let cell = self.cellForRow(at: indexPath) {
            for _ in 0..<numberOfCoins {
                let randomSize = CGFloat.random(in: CGFloat(coinSizeRange.lowerBound)..<(CGFloat(coinSizeRange.upperBound) + 1))
                let coinSize = CGSize(width: randomSize, height: randomSize)
                let coinImageView = UIImageView(frame: CGRect(x: cell.frame.midX - coinSize.width / 2, y: cell.frame.maxY - coinSize.height, width: coinSize.width, height: coinSize.height))
                coinImageView.image = UIImage(named: "coin") // เปลี่ยนเป็นชื่อรูปภาพของเหรียญที่คุณใช้
                self.addSubview(coinImageView)

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

}

extension TableViewCenter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: myTableViewCell, for: indexPath) as! MyTableViewCell
        
        let item = items[indexPath.row]
        cell.textLabel?.text = "ID: \(item.id_gift), User: \(item.user_id), Count: \(item.count)"
        return cell
    }
}
