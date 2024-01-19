//
//  CustomButton.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 19.01.2024.
//

import UIKit

final class CustomButton : UIButton{
    
    private let title : String
    private let titleColor : UIColor
    private let backColor : UIColor
    private let iconName  : String
    
    
    init(title: String, titleColor: UIColor, backColor: UIColor, iconName: String) {
        self.title = title
        self.titleColor = titleColor
        self.backColor = backColor
        self.iconName = iconName
       
      
        super.init(frame: .zero)
        
        self.configureButton(title: title, titleColor: titleColor, backColor: backColor, iconName: iconName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureButton(title: String, titleColor: UIColor, backColor: UIColor, iconName: String){
        
        
        setImage(UIImage(systemName: iconName), for: .normal)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = backColor
        tintColor = titleColor
        translatesAutoresizingMaskIntoConstraints = false 
        
        setUpLayer()
        
    }
    
    private func setUpLayer(){
        layer.cornerRadius = 5
    }
}
