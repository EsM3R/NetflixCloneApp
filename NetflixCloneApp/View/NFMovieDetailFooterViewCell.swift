//
//  NFMovieDetailFooterView.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 20.01.2024.
//

import UIKit

final class NFMovieDetailFooterViewCell :  UIView{
    
    public static let identifier = "NFMovieDetailFooterView"
    
    private let collectionView : UICollectionView =  UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let viewModel = NFMovieDetailFooterViewCollectionViewCellViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        initDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func initDelegate(){
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    private func configureUI(){
        addSubviews(collectionView)
        
        setAttributeCollectionView()
        setCollectionView()
    }
}

// MARK: - SetUp Attribute


extension NFMovieDetailFooterViewCell {
    private func setAttributeCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 200, height: 200)
        collectionView.collectionViewLayout = layout
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension NFMovieDetailFooterViewCell{
    private func setCollectionView(){
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}
