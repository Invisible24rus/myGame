//
//  UIView + Constraints.swift
//  myGame
//
//  Created by NIKITA NIKOLICH on 16.11.2021.
//

import UIKit

extension UIView {
    
    func addSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
    
    func addSubviewsForAutoLayout(_ views: UIView...) {
        addSubviewsForAutoLayout(views)
    }
}
