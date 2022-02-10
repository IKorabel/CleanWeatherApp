//
//  UILabelExtension.swift
//  CleanWeatherApp
//
//  Created by Игорь Корабельников on 10.02.2022.
//

import Foundation
import UIKit

extension UILabel {
    
    func addTextWithImage(text: String, image: UIImage?) {
        guard let image = image else { return }
        let attachment = NSTextAttachment()
        attachment.image = image
        let attachmentString = NSAttributedString(attachment: attachment)
        let myString = NSMutableAttributedString(string: text)
        myString.append(attachmentString)
        attributedText = myString
    }
}
