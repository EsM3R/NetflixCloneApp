//
//  NFHomeViewTableViewCell.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 20.01.2024.
//

import UIKit

protocol NFHomeViewTableViewCellProtocol{
    func update(items : [NFMovieModel])
}


final class NFHomeViewTableViewCell : UITableViewCell{
    
    public static let identifier = "NFHomeViewTableViewCell"
    
    private var items = [NFMovieModel]()
    
    private let viewModel = NFHomeViewCollectionCellViewModel()
    
    
    private let collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
   
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        configureUI()
        initDelegate()
       
        
    }
    
    
    private func configureUI(){
        contentView.addSubviews(collectionView)
        setUpAttributeCollectionView()
        setUpCollectionView()
        setUpLayerCollectionView()
    }
    
    private func initDelegate(){
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
extension NFHomeViewTableViewCell : NFHomeViewTableViewCellProtocol{
    func update(items: [NFMovieModel]) {
        DispatchQueue.main.async {
            self.viewModel.update(items: items)
            self.collectionView.reloadData()
        }
       
       
    }
    
    
}

// MARK: - Setup Attribute


extension NFHomeViewTableViewCell{
    private func setUpAttributeCollectionView(){
        let layout =  UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 140, height: 190)
        collectionView.collectionViewLayout = layout
        collectionView.register(NFHomeViewCollectionViewCellView.self,
                                forCellWithReuseIdentifier: NFHomeViewCollectionViewCellView.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    private func setUpLayerCollectionView(){
        collectionView.layer.cornerRadius  = 10
    }
}


// MARK: - Setup Constraints


extension NFHomeViewTableViewCell{
    private func setUpCollectionView(){
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        ])
    }
}

