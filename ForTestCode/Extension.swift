//
//  Extension.swift
//  Test
//
//  Created by Dev on 22/9/2566 BE.
//

import Foundation
import UIKit

func presentPopover(_ parentViewController: UIViewController, _ viewController: UIViewController, sender: UIView, size: CGSize, arrowDirection: UIPopoverArrowDirection = .down) {
    viewController.preferredContentSize = size
    viewController.modalPresentationStyle = .popover
    if let pres = viewController.presentationController {
        pres.delegate = parentViewController
    }
    parentViewController.present(viewController, animated: true)
    if let pop = viewController.popoverPresentationController {
        pop.sourceView = sender
        pop.sourceRect = sender.bounds
        pop.permittedArrowDirections = arrowDirection
    }
}

extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
    
        return ceil(boundingBox.height)
    }

    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
}
