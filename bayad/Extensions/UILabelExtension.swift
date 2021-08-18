//
//  UILabelExtension.swift
//  bayad
//
//  Created by Ruel Lafuente on 8/18/21.
//

import Foundation
import UIKit

extension UILabel {
  func updateLabel(image: UIImage, with text: String) {
    let attachment = NSTextAttachment()
    attachment.image = image
    attachment.bounds = CGRect(x: 0, y: 0, width: 10, height: 10)
    let attachmentStr = NSAttributedString(attachment: attachment)
    let mutableAttributedString = NSMutableAttributedString()
    mutableAttributedString.append(attachmentStr)
    let textString = NSAttributedString(string: text, attributes: [.font: self.font])
    mutableAttributedString.append(textString)
    self.attributedText = mutableAttributedString
  }
}
