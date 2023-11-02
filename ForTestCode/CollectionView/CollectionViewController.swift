//
//  CollectionViewController.swift
//  ForTestCode
//
//  Created by Dev on 1/11/2566 BE.
//

import UIKit

class CollectionViewController: UIViewController {
    
    
    @IBOutlet weak var cltvShow: UICollectionView!
    private let reuseIden = "cltvViewCell"
    
    private var dataShow = ["ABC","EFG"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCltv()
    }
    
    private func setupCltv() {
        cltvShow.backgroundColor = .clear
        cltvShow.isPagingEnabled = true
        cltvShow.showsVerticalScrollIndicator = true
//        cltvShow.bounces = false
        cltvShow.isDirectionalLockEnabled = true
        cltvShow.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIden)
        cltvShow.delegate = self
        cltvShow.dataSource = self
        collectioViewSetup(sender: cltvShow)
    }
    
    func collectioViewSetup(sender: UICollectionView) {
        switch sender{
        case cltvShow:
            let layoutCollectionView = UICollectionViewFlowLayout()
            let wItemList:CGFloat = UIScreen.main.bounds.width
            let hItemList:CGFloat = cltvShow.bounds.height - self.getNavigationBarHeight() //UIScreen.main.bounds.height
            layoutCollectionView.minimumInteritemSpacing = 0
            layoutCollectionView.minimumLineSpacing      = 0
            layoutCollectionView.itemSize = CGSize.init(width: wItemList, height: hItemList)
            layoutCollectionView.scrollDirection = .vertical
            sender.collectionViewLayout = layoutCollectionView
            sender.contentInsetAdjustmentBehavior = .never
            sender.reloadData()
            break
        default:
            break
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIden, for: indexPath) as! CollectionViewCell
        cell.lbShow.text =  dataShow[indexPath.item]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY < 0 { // Scrolled to top
            dataShow.insert(contentsOf: dataShow, at: 0)
            cltvShow.reloadData()
            scrollView.contentOffset.y += 2 * cltvShow.bounds.height - self.getNavigationBarHeight()
        } else if offsetY + scrollView.frame.size.height > contentHeight { // Scrolled to bottom
            dataShow.append(contentsOf: dataShow)
            cltvShow.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didSelectItemAt -> \(dataShow[indexPath.item])")
    }
}


