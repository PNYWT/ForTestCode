//
//  AnimationRandomBoxView.swift
//  ForTestCode
//
//  Created by Dev on 14/12/2566 BE.
//

import UIKit

class AnimationRandomBoxView: UIView {
    
    private var vRandomBoxImg = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = UIColor.blue
        self.layoutIfNeeded()
    }
    
    func creatViewContentAndShowAnimation(addToView:UIView){
        self.alpha = 0
        vRandomBoxImg.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.addSubview(vRandomBoxImg)
        vRandomBoxImg.image = UIImage(systemName: "shippingbox.fill")
        addToView.addSubview(self)
        UIView.animate(withDuration: 3) {
            self.alpha = 1
            self.transform = CGAffineTransform(translationX: (UIScreen.main.bounds.width + self.frame.width + (UIScreen.main.bounds.width-self.frame.width)/2), y: 0)
        } completion: { check in
            if check {
                self.shakeAnimation {
                    self.vRandomBoxImg.image = UIImage(named: "coin")
                    self.addSparkleEffect()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                        print("Done...")
                        self.removeFromSuperview()
                    }
                }
            }
        }
    }
    
    private func shakeAnimation(completion: @escaping () -> Void) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: vRandomBoxImg.center.x - 10, y: vRandomBoxImg.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: vRandomBoxImg.center.x + 10, y: vRandomBoxImg.center.y))

        vRandomBoxImg.layer.add(animation, forKey: "position")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + (animation.duration * Double(animation.repeatCount)), execute: {
            completion()
        })
    }
    
    private func addSparkleEffect() {
        let emitter = CAEmitterLayer()
        emitter.emitterPosition = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        emitter.emitterShape = CAEmitterLayerEmitterShape.circle
        emitter.emitterSize = CGSize(width: self.frame.width/2, height: self.frame.height/2)
        emitter.renderMode = CAEmitterLayerRenderMode.additive
        
        let cell = CAEmitterCell()
        cell.birthRate = 20
        cell.lifetime = 5.0
        cell.lifetimeRange = 7.0 //ถ้าเป็น 0 จะเท่ากับ lifetime
        cell.velocity = 50 //ความเร็วในการกระจายเริ่มต้น
        cell.velocityRange = 50 //
        cell.emissionRange = .pi * 2.0
        cell.scale = 0.05 //ขนาดคิดเป็นกี่ % ของภาพเดิม
        cell.scaleRange = 0.025 //แต่ละอันขนาดต่างกันได้กี่ %
        cell.contents = UIImage(named: "coin")?.cgImage // ต้องใช้รูปภาพ sparkle
        
        emitter.emitterCells = [cell]
        self.layer.insertSublayer(emitter, at: 0)
    }
}
