//
//  UIBuilder.swift
//  UIKit - 09 - dz
//
//  Created by Олег Дмитриев on 14.08.2024.
//

import UIKit

class UIBuilders {
    
    func addLabel(text: String, fontS: CGFloat, fontW: UIFont.Weight, color: UIColor = .appBlack) -> UILabel {
        let txt = UILabel()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.text = text

        txt.font = .systemFont(ofSize: fontS, weight: fontW)
        txt.textColor = color
        txt.numberOfLines = 0
        
        return txt
    }
    
    func addImage(image: String, offsetH: CGFloat) -> UIImageView {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false

        img.image = UIImage(named: image)
        img.heightAnchor.constraint(equalToConstant: offsetH).isActive = true
        img.layer.cornerRadius = 0
        img.layer.masksToBounds = true
        
        return img
    }
    
    func addHStack(spacing: CGFloat, distribution: UIStackView.Distribution, alignment: UIStackView.Alignment) -> UIStackView {
        let stack = UIStackView()
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.axis = .horizontal
        stack.spacing = spacing

        stack.distribution = distribution
        stack.alignment = alignment
        
        return stack
    }
    
}
