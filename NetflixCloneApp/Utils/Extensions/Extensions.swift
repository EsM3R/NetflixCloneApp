//
//  Extensions.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 17.01.2024.
//

import UIKit



extension UIView {
    func addSubviews(_ views : UIView...){
        views.forEach { addSubview($0)}
    }
}
