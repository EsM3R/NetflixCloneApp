//
//  NFMovieDetailHeaderView.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 20.01.2024.
//

import UIKit

final class NFMovieDetailHeaderView : UIView{
    
    private let movie : NFMovieModel

    private let imageView : UIImageView = UIImageView()
    
    private let nameLabel : UILabel = UILabel()
    
    private let playButton : UIButton = CustomButton(title: "Play", titleColor: .darkGray, backColor: .white, iconName: "play.fill")
    
    private let downloadButton : UIButton = CustomButton(title: "Download", titleColor: .white, backColor: .darkGray, iconName: "arrow.down.to.line")
    
    private let descriptionLabel : UILabel = UILabel()

    
    
     init(frame: CGRect , movie : NFMovieModel) {
        self.movie = movie
       
        super.init(frame: frame)
        configureUI()
        configure()
    }
    
    private func configureUI(){
        addSubviews(imageView,nameLabel,playButton,downloadButton,descriptionLabel)
        
        setUpAttributeImageView()
        setUpImageView()
        
        setUpAttributeNameLabel()
        setUpNameLabel()
        
        setUpPlayButton()
        setUpDownloadButton()
        
        setAttributtedDescriptionLabel()
        setUpDescriptionLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        nameLabel.text = movie.original_title
        descriptionLabel.text =  movie.overview
        
        let imageUrl = movie.poster_path

        NFImageService.shared.fetchImage(imageUrl: imageUrl) { result in
            switch result{
            case .success(let data):
                DispatchQueue.main.async{
                    self.imageView.image = UIImage(data: data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            
            }
        }
        
        
    }
    
    
}

// MARK: - SetUp Attribute


extension NFMovieDetailHeaderView {
    private func setUpAttributeImageView(){
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    private func setUpAttributeNameLabel(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "The Beekeeper"
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    private func setAttributtedDescriptionLabel(){
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 3
        descriptionLabel.textAlignment = .left
        descriptionLabel.font  = UIFont.systemFont(ofSize: 11)
        descriptionLabel.text =  "In attempt to find a non-violent alternative for reducing Hell's overpopulation, the daughter of Lucifer opens a rehabilitation hotel that offers a group of misfit demons a chance at redemption."
    }
}

// MARK: - SetUp Constraints


extension NFMovieDetailHeaderView{
    private func setUpImageView(){
        let height = UIScreen.main.bounds.height
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo:topAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor),
            imageView.rightAnchor.constraint(equalTo: rightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: height * 0.27)
        ])
    }
    private func setUpNameLabel(){
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor , constant: 10),
            nameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            nameLabel.rightAnchor.constraint(equalTo: rightAnchor , constant:  -10)
        ])
    }
    
    private func setUpPlayButton(){
        NSLayoutConstraint.activate([
            playButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor , constant:  10),
            playButton.leftAnchor.constraint(equalTo: nameLabel.leftAnchor ),
            playButton.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            playButton.heightAnchor.constraint(equalToConstant: 45)
        
        ])
    }
    private func setUpDownloadButton(){
        NSLayoutConstraint.activate([
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor , constant:  10),
            downloadButton.leftAnchor.constraint(equalTo: nameLabel.leftAnchor ),
            downloadButton.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            downloadButton.heightAnchor.constraint(equalToConstant: 45)
        
        ])
    }
    
    private func setUpDescriptionLabel(){
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor , constant:  10),
            descriptionLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor ),
            descriptionLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            
        ])
    }

}
