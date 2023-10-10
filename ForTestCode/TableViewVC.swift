//
//  TableViewVC.swift
//  Test
//
//  Created by Dev on 10/10/2566 BE.
//

import UIKit

class TableViewVC: UIViewController {
    
    @IBOutlet weak var tbv: TableViewCenter!
    
//    var items = [Item]()
//    let idTest = [1,2,3,4,5,6,7,8]
//    var timer: Timer?
//    private let myTableViewCell = "myTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tbv.dataSource = self
//        tbv.delegate = self
//        tbv.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: myTableViewCell)
//
//        // เริ่มต้นตั้งค่า Timer เพื่อตรวจสอบและลบค่าที่ไม่ได้อัปเดตทุก ๆ 5 วินาที
//        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
//            self?.checkAndUpdateData()
//        }
    }
    
//    func addItem(item: Item) {
//        // ลบรายการที่มี ID เดียวกัน (ถ้ามี)
//        items = items.filter { $0.id != item.id }
//
//        // เพิ่มรายการใหม่ลงไปด้านบนของรายการ
//        items.insert(item, at: 0)
//
//        // ให้แสดงเฉพาะ 4 รายการล่าสุด
//        if items.count > 4 {
//            items.removeLast(items.count - 4)
//        }
//
//        tbv.reloadData()
//    }
    
//    func checkAndUpdateData() {
//        // ตรวจสอบการอัปเดตข้อมูล หากไม่มีการอัปเดตในระยะเวลา 5 วินาทีให้ลบรายการที่ไม่ได้อัปเดต
//        let currentTime = Date().timeIntervalSince1970
//        let updatedItems = items.filter { currentTime - Double($0.value) < 5.0 }
//
//        if items.count != updatedItems.count {
//            items = updatedItems
//            tbv.reloadData()
//        }
//    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        tbv.addItemByBtn()
        // สร้างรายการใหม่และเพิ่มเข้าไปในตาราง
//        let newItem = Item(id: idTest.randomElement()!, value: Int(Date().timeIntervalSince1970))
//        addItem(item: newItem)
    }
}

//extension TableViewVC:UITableViewDataSource, UITableViewDelegate{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return items.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: myTableViewCell, for: indexPath) as! MyTableViewCell
//
//        let item = items[indexPath.row]
//        cell.textLabel?.text = "ID: \(item.id), Value: \(item.value)"
//
//        return cell
//    }
//}
