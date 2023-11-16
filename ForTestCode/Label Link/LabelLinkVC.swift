//
//  LabelLinkVC.swift
//  ForTestCode
//
//  Created by Dev on 14/11/2566 BE.
//

import UIKit

class LabelLinkVC: UIViewController {
    
    private var labelLink:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        setUI()
    }
    
    private func setUI(){
        labelLink = UILabel(frame: CGRect(x: 0, y: self.getSaftArea().top + self.getNavigationBarHeight() + 50, width: self.view.frame.width, height: 50))
        labelLink.backgroundColor = .gray
        self.view.addSubview(labelLink)
        
        labelLink.textColor = .white
        labelLink.textAlignment = .center
        labelLink.numberOfLines = 0
        addLabel(text: "ABC www.google.co.th ABC s;adksa;ldas www.youtube.com hello github.com")
    }
    
    private func addLabel(text: String) {
        let attributedString = NSMutableAttributedString(string: text)
        
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: text, options: [], range: NSRange(location: 0, length: text.utf16.count))
        
        matches?.forEach {
            var urlString = String(text[Range($0.range, in: text)!])
            if !urlString.lowercased().starts(with: "http://") && !urlString.lowercased().starts(with: "https://") {
                urlString = "http://" + urlString
            }
            attributedString.addAttribute(.link, value: urlString, range: $0.range)
        }
        
        labelLink.attributedText = attributedString
        labelLink.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        labelLink.addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped(_ recognizer: UITapGestureRecognizer) {
        let labelString = (labelLink.attributedText?.string)!
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: labelString, options: [], range: NSRange(location: 0, length: labelString.utf16.count))
        
        let tapLocation = recognizer.location(in: labelLink)
        let tapIndex = labelLink.characterIndexAtLocation(tapLocation)
        
        matches?.forEach {
            if $0.range.contains(tapIndex) {
                var urlString = String(labelString[Range($0.range, in: labelString)!])
                if !urlString.lowercased().starts(with: "http://") && !urlString.lowercased().starts(with: "https://") {
                    urlString = "http://" + urlString
                }
                if let url = URL(string: urlString) {
                    UIApplication.shared.open(url)
                }
            }
        }
    }
}

extension UILabel {
    func characterIndexAtLocation(_ location: CGPoint) -> Int {
        guard let attributedText = self.attributedText else { return -1 }

        let textStorage = NSTextStorage(attributedString: attributedText)
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)

        let textContainer = NSTextContainer(size: self.bounds.size)
        textContainer.lineFragmentPadding = 0
        textContainer.lineBreakMode = self.lineBreakMode
        textContainer.maximumNumberOfLines = self.numberOfLines
        layoutManager.addTextContainer(textContainer)

        let index = layoutManager.characterIndex(for: location, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        return index
    }
}
