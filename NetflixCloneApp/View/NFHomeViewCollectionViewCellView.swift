//
//  NFHomeViewCollectionCellView.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 20.01.2024.
//

import UIKit

protocol NFHomeViewCollectionViewCellViewProtocol{
    func configure(movie : NFMovieModel)
}

final class NFHomeViewCollectionViewCellView : UICollectionViewCell{
    
    public static let identifier  =  "NFHomeViewCollectionViewCellView"
    
    private let collectionImageView : UIImageView = UIImageView()
    
    private let viewModel = NFHomeViewCollectionCellViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI(){
        contentView.addSubviews(collectionImageView)
        
        setUpAttributeCollectionImageView()
        setUpCollectionImageView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NFHomeViewCollectionViewCellView : NFHomeViewCollectionViewCellViewProtocol{
    func configure(movie : NFMovieModel) {
        let imageUrl = movie.poster_path
        
        NFImageService.shared.fetchImage(imageUrl: imageUrl) { result  in
        switch result{
            case .success(let data):
                DispatchQueue.main.async{
                    self.collectionImageView.image = UIImage(data: data)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}

// MARK: - SetUP Attribute


extension NFHomeViewCollectionViewCellView {
    private func setUpAttributeCollectionImageView(){
        
        collectionImageView.translatesAutoresizingMaskIntoConstraints = false
        collectionImageView.contentMode = .scaleAspectFill
        collectionImageView.clipsToBounds = true
       
        
    }
}

// MARK: - Setup Constraints

extension NFHomeViewCollectionViewCellView{
    private func setUpCollectionImageView(){
        NSLayoutConstraint.activate([
            
            collectionImageView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionImageView.topAnchor.constraint(equalTo: topAnchor),
            collectionImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionImageView.rightAnchor.constraint(equalTo: rightAnchor)
            
        ])
    }
}

