//
//  UIView.ext.swift
//  UIKit - 09 - dz
//
//  Created by Олег Дмитриев on 14.08.2024.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView ...) {
        views.forEach {
            self.addSubview($0)
        }
    }
    
}
