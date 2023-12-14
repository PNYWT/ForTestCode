//
//  SingleRowColumnCltv.swift
//  ForTestCode
//
//  Created by Dev on 13/12/2566 BE.
//

import Foundation
import UIKit

@objc(SingleRowColumnCltvDelegate)
protocol SingleRowColumnCltvDelegate{
    func didselect()
}

@objc(SingleRowColumnCltv)
class SingleRowColumnCltv: UICollectionView {
    
    private let reuseIdentifier = "GiftBoxCell"
    
    var delegateCltv:SingleRowColumnCltvDelegate?
    private var isHorizontalLayout: Bool = false

    init(frame: CGRect, isHorizontal: Bool) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = isHorizontal ? .horizontal : .vertical
        self.isHorizontalLayout = isHorizontal
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .clear
        self.registerCell()
    }
    
    private func registerCell(){
        self.delegate = self
        self.dataSource = self
        self.register(UINib(nibName: "GiftBoxViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SingleRowColumnCltv: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! GiftBoxViewCell
        cell.backgroundColor = .red
        return cell
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionViewLayout is UICollectionViewFlowLayout {
            let length = isHorizontalLayout ? collectionView.frame.height : collectionView.frame.width
            return CGSize(width: length, height: length)
        }
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10 // ระยะห่างระหว่าง cell
        }

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            if isHorizontalLayout {
                return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10) // ขอบเขตเสริมสำหรับแนวนอน
            } else {
                return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0) // ขอบเขตเสริมสำหรับแนวตั้ง
            }
        }
}
