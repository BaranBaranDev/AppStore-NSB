//
//  UIStackView+Ext.swift
//  AppStore-NSB
//
//  Created by Baran Baran on 14.04.2024.
//

import UIKit


extension UIStackView {
    func addArrangedSubviewFromExt(_ views: UIView ...){
        for view in views{
            addArrangedSubview(view)
        }
    }
}


