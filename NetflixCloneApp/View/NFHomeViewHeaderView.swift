//
//  NFHomeViewHeaderView.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 17.01.2024.
//

import Foundation


import UIKit


final class NFHomeViewHeaderView : UIView{
    
    private let headerImageView : UIImageView = UIImageView()
    

//    private let myListButton : UIButton = CustomButton(title: "My List",
//                                                       iconName: "plus",
//                                                       tintColor: .white,
//                                                       backgroundColor: .systemGray)
    private var playButton : UIButton = UIButton()
    private let myListButton : UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        configureUI()
    }

    
    private func configureUI(){
        
      
        
        
        addSubviews(headerImageView,playButton ,myListButton)
        
        setUpAttributeheaderImageView()
        playButton.translatesAutoresizingMaskIntoConstraints = false
        
        setUpHeaderImageView()
        setUpImageLayer()
     
        setUpMyListButton()
        setUpPlayButton()
        
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    
}


// MARK: - Set up Attribute

extension NFHomeViewHeaderView{
    
    private func setUpAttributeheaderImageView(){
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = true
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        headerImageView.image = UIImage(named: "demo")
    }
    
    private func setUpImageLayer(){
        
        headerImageView.layer.cornerRadius = 15
        headerImageView.layer.borderWidth = 0.25
        headerImageView.layer.borderColor = UIColor.white.cgColor
        headerImageView.layer.shadowRadius = 10
    }

    
}

// MARK: - Set up Constraints

extension NFHomeViewHeaderView{
    
    private func setUpHeaderImageView(){
        
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor , constant: 0),
            headerImageView.leftAnchor.constraint(equalTo: leftAnchor , constant: 30),
            headerImageView.rightAnchor.constraint(equalTo: rightAnchor , constant: -30),
            headerImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10),
        ])
 
    }
    

    
    private func setUpPlayButton(){
      
        NSLayoutConstraint.activate([
            
            playButton.leftAnchor.constraint(equalTo: headerImageView.leftAnchor , constant: 10),
            playButton.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor , constant: -10),
            
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.widthAnchor.constraint(equalToConstant: 150),

            
            
        ])
    }
    
    private func setUpMyListButton(){
        
       
        
        NSLayoutConstraint.activate([
            

            myListButton.rightAnchor.constraint(equalTo: headerImageView.rightAnchor , constant: -10),
            myListButton.bottomAnchor.constraint(equalTo: headerImageView.bottomAnchor , constant: -10),
            
            myListButton.heightAnchor.constraint(equalToConstant: 40),
            myListButton.widthAnchor.constraint(equalToConstant: 150),

            
        ])
    }
    
    
}

