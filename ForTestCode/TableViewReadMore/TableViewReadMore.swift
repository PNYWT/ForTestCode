//
//  TableViewReadMore.swift
//  ForTestCode
//
//  Created by Dev on 14/11/2566 BE.
//

import Foundation
import UIKit

class TableViewReadMore: UIViewController {
    
    private var tbvShow:UITableView!
    var data = ["Short Text", "Very long text... Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."]
    var expandedCells = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setUI()
    }
    
    private func setUI(){
        tbvShow = UITableView(frame: CGRect(x: 0, y: self.getSaftArea().top, width: self.view.frame.width, height: self.view.frame.height - self.getSaftArea().top))
        self.view.addSubview(tbvShow)
        tbvShow.backgroundColor = .gray
        tbvShow.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        tbvShow.dataSource = self
        tbvShow.delegate = self
    }
}

extension TableViewReadMore: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(withText: data[indexPath.row], isExpanded: expandedCells.contains(indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if expandedCells.contains(indexPath) {
            expandedCells.remove(indexPath)
        } else {
            expandedCells.insert(indexPath)
        }
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return expandedCells.contains(indexPath) ? UITableView.automaticDimension : 100 // ความสูงเริ่มต้น
        return UITableView.automaticDimension
    }
}
