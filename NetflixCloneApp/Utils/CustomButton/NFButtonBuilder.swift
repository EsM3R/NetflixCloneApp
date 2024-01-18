//
//  NFButton.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 18.01.2024.
//

import Foundation

class NFButtonBuilder: CustomButtonBuilder {
    private var customButton = CustomButton()

    func buildCornerRadius() {
        customButton.cornerRadius = 12
    }

    func buildTitleColor() {
        customButton.tintColor = .white
    }

    func buildBackgroundColor() {
        customButton.backgroundColor = .blue
    }

    func buildTitle() {
        customButton.setTitle("HelloWorld", for: .normal)
    }

    func getResult() -> CustomButton {
        return customButton
    }
}


//class CustomButton : UIButton {
//
//    init(title : String  , iconName : String , tintColor : UIColor , backgroundColor : UIColor) {
//        super.init(frame: .zero)
//        configureButton(title: title, iconName: iconName, tintColor: tintColor, backgroundColor: backgroundColor)
//    }
//
//    private func  configureButton(title : String  , iconName : String , tintColor : UIColor , backgroundColor : UIColor){
//        let image = UIImage(systemName: iconName)?.withRenderingMode(.alwaysTemplate)
//        setTitle(title, for: .normal)
//        setImage(image, for: .normal)
//        self.tintColor = tintColor
//        self.backgroundColor = backgroundColor
//        titleEdgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 0)
//        translatesAutoresizingMaskIntoConstraints = false
//        layer.cornerRadius = 5
//        setTitleColor(tintColor, for: .normal)
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
