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

extension UIViewController{
    //ใช้ใน nav ตั้งชื่อหน้า
    func setViewControllerTitle(_ viewController: UIViewController, title: String?) {
        if let title_name = title{
            viewController.title = title_name
        }else{
            viewController.title = ""
        }
    }

    func getSaftArea() -> UIEdgeInsets {
        return self.view.safeAreaInsets
    }
    
    func getNavigationBarHeight() -> CGFloat {
        if let navigationController = self.navigationController {
            return navigationController.navigationBar.frame.height
        }
        return 44
    }
    
    func getNavigationBarOriginalY() -> CGFloat {
        if let navigationController = self.navigationController {
            return navigationController.navigationBar.frame.origin.y
        }
        return 50
    }
    
    func getTabbarBarHeight() -> CGFloat {
        if let navigationController = self.navigationController {
            return navigationController.tabBarController?.tabBar.frame.height ?? 0
        }
        return 44
    }


    func getStatusBarHeight() -> CGFloat {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            return windowScene.statusBarManager?.statusBarFrame.height ?? 0
        }
        return 44
    }
}

extension JSONDecoder {

    func decodeToAnyString<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        let anyData = try JSONSerialization.jsonObject(with: data, options: [])
        let stringData = convertAnyToString(anyData)
        let convertedData = try JSONSerialization.data(withJSONObject: stringData, options: [])
        return try self.decode(T.self, from: convertedData)
    }

    private func convertAnyToString(_ value: Any) -> Any {
        switch value {
        case let stringValue as String:
            return stringValue
        case let numberValue as NSNumber:
            return numberValue.stringValue
        case let arrayValue as [Any]:
            return arrayValue.map(convertAnyToString)
        case let dictionaryValue as [String: Any]:
            return dictionaryValue.mapValues(convertAnyToString)
        default:
            return "\(value)"
        }
    }
}
