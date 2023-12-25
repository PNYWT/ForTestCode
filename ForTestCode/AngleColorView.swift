//
//  AngleColorView.swift
//  ForTestCode
//
//  Created by Dev on 21/12/2566 BE.
//

import UIKit

class AngleColorView:UIViewController{
    
    private var headerView:UIView!
    private var vColorAngle:AngleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        headerView = UIView(frame: CGRect(x: 0, y: self.getStatusBarHeight() + self.getNavigationBarHeight(), width: self.view.frame.width, height: 50))
        headerView.backgroundColor = .yellow
        self.view.addSubview(headerView)
        
        vColorAngle = AngleView(frame: CGRect(x: 0, y: 0, width: headerView.frame.size.width * 0.4, height: headerView.frame.size.height))
        vColorAngle.fillColor = .red
        headerView.addSubview(vColorAngle)
    }
}
