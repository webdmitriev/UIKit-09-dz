//
//  UIStackView.ext.swift
//  UIKit - 09 - dz
//
//  Created by Олег Дмитриев on 14.08.2024.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView ...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
    
}
