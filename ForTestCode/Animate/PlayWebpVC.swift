//
//  PlayWebpVC.swift
//  ForTestCode
//
//  Created by Dev on 17/11/2566 BE.
//

import Foundation
import UIKit
import SDWebImage
import SDWebImageWebPCoder

class PlayWebpVC:UIViewController{
    
    private var imgWebp:SDAnimatedImageView!
    let urlS = "https://img.callplay.in.th/gift/2022-08/630de8facd15a.webp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        imgWebp = SDAnimatedImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        imgWebp.center = self.view.center
        self.view.addSubview(imgWebp)
        
        imgWebp.contentMode = .scaleAspectFit

        imgWebp.backgroundColor = .red
        imgWebp.sd_setImage(with: URL(string: urlS), placeholderImage: nil, options: .retryFailed) { (image, error, cacheType, imageURL) in
            if let animatedImage = image as? SDAnimatedImage {
                if let lastFrame = self.imgWebp.player?.totalFrameCount{
                    let frameDuration = animatedImage.animatedImageDuration(at: lastFrame - 1)
                    print("frameDuration -> \(frameDuration)")
                }
                self.imgWebp.shouldCustomLoopCount = true
                self.imgWebp.animationRepeatCount = 3
                self.imgWebp.startAnimating()
            }
        }
    }
}
