//
//  ViewController.swift
//  Test
//
//  Created by Dev on 15/8/2566 BE.
//

import UIKit
import SpeedcheckerSDK
import CoreLocation

class ViewController: UIViewController {
    
    var getArrData:[TypeModel]{
        return arrData
    }
    
    private var arrData:[TypeModel] = []
    
    @IBOutlet weak var cltvGrid: UICollectionView!
    private let cellReuseIdentifier = "GridBtnCell"
    @IBOutlet weak var lbSpeedTest: UILabel!
    private var internetTest: InternetSpeedTest?
    private var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAuthorization()
        cltvGridSetup()
        LoadData.readJsonTitle { dataMenu in
            if let dataReturn = dataMenu{
                self.arrData = dataReturn
            }
        } updateUI: { canUpdate in
            if canUpdate{
                self.cltvGrid.reloadData()
                self.lbSpeedTest.isHidden = true
                self.internetTest = InternetSpeedTest(delegate: self)
            }else{
                print("Load fail. UIShow No Data.")
            }
        }
    }
    
    private func cltvGridSetup(){
        cltvGrid.delegate = self
        cltvGrid.dataSource = self
        cltvGrid.register(UINib(nibName: "CltvGridBtnCell", bundle: nil), forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    private func requestLocationAuthorization() {
        DispatchQueue.global().async {
            guard CLLocationManager.locationServicesEnabled() else {
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.locationManager.requestWhenInUseAuthorization()
                self?.locationManager.requestAlwaysAuthorization()
            }
        }
    }
    
    
    @objc func animateCoinsBurst() {
        let numberOfCoins = 50 // จำนวนเหรียญที่คุณต้องการให้พุ่ง
        let coinSize = CGSize(width: 50, height: 50)
        
        for _ in 0..<numberOfCoins {
            let coinImageView = UIImageView(frame: CGRect(x: 0, y: self.view.frame.height - coinSize.height, width: coinSize.width, height: coinSize.height))
            coinImageView.image = UIImage(named: "coin") // เปลี่ยนเป็นชื่อรูปภาพของเหรียญที่คุณใช้
            self.view.addSubview(coinImageView)
            
            let randomX = CGFloat.random(in: 0...(self.view.frame.width - coinSize.width))
            let randomY = CGFloat.random(in: 0...(self.view.frame.height - coinSize.height))
            
            UIView.animate(withDuration: 0.5, animations: {
                // กำหนดตำแหน่งที่เหรียญจะพุ่งขึ้น
                coinImageView.frame.origin = CGPoint(x: randomX, y: randomY)
                
            }) { (completed) in
                UIView.animate(withDuration: 0.5, animations: {
                    // กำหนดตำแหน่งที่เหรียญจะตกลงมา
                    coinImageView.frame.origin = CGPoint(x: randomX, y: self.view.frame.height - coinSize.height)
                    
                }) { (completed) in
                    coinImageView.removeFromSuperview()
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellGrid = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! CltvGridBtnCell
        cellGrid.lbTitle.text = arrData[indexPath.item].title
        cellGrid.lbTitle.textAlignment = .center
        cellGrid.lbTitle.numberOfLines = 0
        return cellGrid
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch arrData[indexPath.item].title{
        case "BudgetVC":
            let vc = BudgetVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "AngleColorView":
            let vc = AngleColorView()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "SingleRowColumnCltv":
            let vc = SingleRowColumnCltvVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "RxSwift":
            break
        case "Collection FullScreen":
            let vc = CollectionViewController()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "SpeedTest":
            //check only download
            self.lbSpeedTest.isHidden = false
            internetTest?.startWithOptions(.init(uploadTimeMs: 0), { error in
                if error != .ok {
                    print(error)
                }
            })
            break
        case "GiftList":
            let vc = GiftListVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "Animate":
            let vc = AnimateVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "TableView":
            let vc = TableViewVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "CoinBurst":
            animateCoinsBurst()
            break
        case "PopOver":
            if let sender = collectionView.cellForItem(at: indexPath){
                let popoverContent = PopoverViewController(infoText: "Username must be between 3-20 and can only consist of alphanumeric characters.")
                presentPopover(self, popoverContent, sender: sender, size: CGSize(width: 315, height: 120), arrowDirection: .down)
            }
            break
            
        case "Label Link":
            let vc = LabelLinkVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "TableViewReadMore":
            let vc = TableViewReadMore()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "Play .webp":
            let vc = PlayWebpVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        case "MVVM":
            let vc = MVVMShowDataVC()
            self.navigationController?.pushViewController(vc, animated: true)
            break
        default:
            break
        }
    }
}

extension ViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let layout = cltvGrid.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.estimatedItemSize = .zero
            cltvGrid.collectionViewLayout = layout
        }
        
        let columns = 4
        let spacingItem  = 8
        let sectionInsets = UIEdgeInsets.zero
        let paddingSpace = sectionInsets.left + sectionInsets.right + (CGFloat(spacingItem) * CGFloat(columns - 1))
        let availableWidth = cltvGrid.frame.width - paddingSpace
        let widthPerItem = (availableWidth / CGFloat(columns)) - 1
        cltvGrid.contentInset = UIEdgeInsets.zero
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
                        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


extension ViewController: InternetSpeedTestDelegate{
    func internetTestError(error: SpeedcheckerSDK.SpeedTestError) {
       
    }
    
    func internetTestFinish(result: SpeedcheckerSDK.SpeedTestResult) {
        print("Done")
        print("downloadSpeed \(result.downloadSpeed.mbps)")
        print("uploadSpeed \(result.uploadSpeed.mbps)")
        print("latencyInMs \(result.latencyInMs)")
    }
    
    func internetTestReceived(servers: [SpeedcheckerSDK.SpeedTestServer]) {
        
    }
    
    func internetTestSelected(server: SpeedcheckerSDK.SpeedTestServer, latency: Int, jitter: Int) {
        
    }
    
    func internetTestDownloadStart() {
    }
    
    func internetTestDownloadFinish() {

    }
    
    func internetTestDownload(progress: Double, speed: SpeedcheckerSDK.SpeedTestSpeed) {
        DispatchQueue.main.async {
            self.lbSpeedTest.text = String(format: "Download: \n%@ Mbps", speed.descriptionInMbps)
        }
    }
    
    func internetTestUploadStart() {
    }
    
    func internetTestUploadFinish() {
    }
    
    func internetTestUpload(progress: Double, speed: SpeedcheckerSDK.SpeedTestSpeed) {
        print("Upload: \(speed.descriptionInMbps)")
    }
}
