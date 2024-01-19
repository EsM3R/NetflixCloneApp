//
//  NFNewAndHotTableViewCell.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 18.01.2024.
//

import UIKit

protocol NFNewAndHotTableViewCellProtocol{
    func configure(movie : NFMovieModel )
}

final class  NFNewAndHotTableViewCell : UITableViewCell{
    
    public static let identifer = "NFNewAndHotTableViewCell"
        
    private let dateLabel : UILabel = UILabel()
    
    private let dateNameLabel : UILabel = UILabel()

    private let posterImageView : UIImageView = UIImageView()
    
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
        addSubviews(dateLabel,dateNameLabel,posterImageView,nameLabel,notifactionButton,infoButton,descriptionLabel)
        
        
       
        setUpAttributeDateLabel()
        setUpAttributeDateNameLabel()
        setUpAttributePosterImageView()
        setUpAttributeNameLabel()
        setUpAttributeDescriptionLabel()

        
        setUpDateLabel()
        setUpDateNameLabel()
        setUpPosterImageView()
        setUpNameLabel()
        setUpDescriptionLabel()

     
        
    }
    
}
// MARK: - Protocol for configure UI

extension NFNewAndHotTableViewCell : NFNewAndHotTableViewCellProtocol{
    func configure(movie: NFMovieModel) {
        self.nameLabel.text  = movie.original_title
        self.descriptionLabel.text  =  movie.overview
        self.dateLabel.text = "26"
        self.dateNameLabel.text = "FEB"
        
        let imageUrl = movie.poster_path
        
        NFImageService.shared.fetchImage(imageUrl: imageUrl) { result  in
        switch result{
            case .success(let data):
                DispatchQueue.main.async{
                    self.posterImageView.image = UIImage(data: data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}





// MARK: - Set up  Attribute

extension NFNewAndHotTableViewCell {
    
   
    private func setUpAttributeDateLabel(){
        dateLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setUpAttributeDateNameLabel(){
        dateNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .black)
        dateNameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUpAttributePosterImageView(){
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.backgroundColor = .red
        posterImageView.layer.cornerRadius = 15
        posterImageView.clipsToBounds = true
        posterImageView.contentMode = .scaleAspectFill
    }
    
    
    private func setUpAttributeNameLabel(){
        nameLabel.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setUpAttributeNoticationButton(){
        let image = UIImage(systemName: "bell", withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .semibold)))
        notifactionButton.translatesAutoresizingMaskIntoConstraints = false
        notifactionButton.setImage(image, for: .normal)
        notifactionButton.tintColor = .white
    }
    
    private func setUpAttributeInfoButton(){
        let image = UIImage(systemName: "info.circle", 
                            withConfiguration: UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 24, weight: .semibold)))
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        infoButton.setImage(image, for: .normal)
        infoButton.tintColor = .white
    }
    
    private func setUpAttributeDescriptionLabel(){
        descriptionLabel.font = UIFont.systemFont(ofSize: 11)
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 3
        descriptionLabel.lineBreakMode = .byWordWrapping
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    
}


// MARK: - Set up Constraints


extension NFNewAndHotTableViewCell{
    
    
    private func setUpDateLabel(){
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor , constant: 10),
        ])
    }
    private func setUpDateNameLabel(){
        NSLayoutConstraint.activate([
            dateNameLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor , constant: 2),
            dateNameLabel.leftAnchor.constraint(equalTo: leftAnchor , constant: 10),
        ])
    }
    
    private func setUpPosterImageView(){
        
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        NSLayoutConstraint.activate([
            posterImageView.heightAnchor.constraint(equalToConstant: height * 0.27),
            posterImageView.widthAnchor.constraint(equalToConstant: width - 75),
            posterImageView.topAnchor.constraint(equalTo: topAnchor),
            posterImageView.leftAnchor.constraint(equalTo: dateLabel.rightAnchor ,constant: 10),
            posterImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ])
    }
    private func setUpNameLabel(){
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: posterImageView.leftAnchor),
            nameLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor , constant: 5)
        ])
    }
    
    private func setUpDescriptionLabel(){
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo: posterImageView.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: posterImageView.rightAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
        ])
    }
    

    
   
}
