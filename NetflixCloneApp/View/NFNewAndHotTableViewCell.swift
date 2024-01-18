//
//  NFNewAndHotTableViewCell.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 18.01.2024.
//

import UIKit

final class  NFNewAndHotTableViewCell : UITableViewCell{
    
    public static let identifer = "NFNewAndHotTableViewCell"
    
    private let vStackView : UIStackView = UIStackView()
    
    private let dateLabel : UILabel = UILabel()
    
    private let dateNameLabel : UILabel = UILabel()

    private let posterImageView : UIImageView = UIImageView()
    
    private let hStackView : UIStackView = UIStackView()
    
    private let nameLabel : UILabel = UILabel()
    
    private let notifactionButton  : UIButton = UIButton()
    
    private let infoButton : UIButton = UIButton()

    private let descriptionLabel : UILabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI(){
        addSubviews(vStackView,posterImageView,hStackView,descriptionLabel)
        
        
        setUpAttributeVStackView()
        setUpAttributeDateLabel()
        setUpAttributeDateNameLabel()
        setUpAttributePosterImageView()
        setUpAttributeHStackView()
        setUpAttributeNameLabel()
        setUpAttributeNoticationButton()
        setUpAttributeInfoButton()
        setUpAttributeDescriptionLabel()
        
        setUpVStackView()
        setUpPosterImageView()
        setUpHStackView()
        setUpDescriptionLabel()
        
    }
    
}


// MARK: - Set up  Attribute

extension NFNewAndHotTableViewCell {
    
    private func setUpAttributeVStackView(){
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.spacing = 5
        vStackView.axis = .vertical
       
        vStackView.addArrangedSubview(dateNameLabel)
        vStackView.addArrangedSubview(dateLabel)
    }
    private func setUpAttributeDateLabel(){
        dateLabel.text = "09"
        dateLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setUpAttributeDateNameLabel(){
        dateNameLabel.text = "Feb"
        dateNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .black)
        dateNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpAttributePosterImageView(){
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.image = UIImage(named: "demo")
        posterImageView.backgroundColor = .red
        posterImageView.layer.cornerRadius = 15
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill
    }
    
    private func setUpAttributeHStackView(){
        hStackView.translatesAutoresizingMaskIntoConstraints = false
        hStackView.spacing = 5
        hStackView.axis = .horizontal
    
        hStackView.addArrangedSubview(nameLabel)
        hStackView.addArrangedSubview(notifactionButton)
        hStackView.addArrangedSubview(infoButton)
    }
    
    private func setUpAttributeNameLabel(){
        nameLabel.text = "Kubra"
        nameLabel.font = UIFont.systemFont(ofSize: 35, weight: .heavy)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setUpAttributeNoticationButton(){
        let image = UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .semibold)))
        notifactionButton.translatesAutoresizingMaskIntoConstraints = false
        notifactionButton.setImage(image, for: .normal)
        notifactionButton.tintColor = .white
    }
    
    private func setUpAttributeInfoButton(){
        let image = UIImage(systemName: "info.circle", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .semibold)))
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.setImage(image, for: .normal)
        infoButton.tintColor = .white
    }
    
    private func setUpAttributeDescriptionLabel(){
        descriptionLabel.font = UIFont.systemFont(ofSize: 12)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 3
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    
}


// MARK: - Set up Constraints


extension NFNewAndHotTableViewCell{
    
    
    private func setUpVStackView(){
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: topAnchor),
            vStackView.leftAnchor.constraint(equalTo: leftAnchor , constant: 10),
        ])
    }
    
    private func setUpPosterImageView(){
        
        let height = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            posterImageView.heightAnchor.constraint(equalToConstant: height * 0.3),
            posterImageView.leftAnchor.constraint(equalTo: dateLabel.rightAnchor ,constant: 10),
            posterImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ])
    }
    
    private func setUpHStackView(){
        NSLayoutConstraint.activate([
            
            hStackView.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 10),
            hStackView.leftAnchor.constraint(equalTo: posterImageView.leftAnchor),
            hStackView.rightAnchor.constraint(equalTo: posterImageView.rightAnchor),
            
        ])
    }
    private func setUpDescriptionLabel(){
        NSLayoutConstraint.activate([
    
            descriptionLabel.leftAnchor.constraint(equalTo: posterImageView.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: posterImageView.rightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: infoButton.bottomAnchor, constant: 8)
            
        ])
    }
}
