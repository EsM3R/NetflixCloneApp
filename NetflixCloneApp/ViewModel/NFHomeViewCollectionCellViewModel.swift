//
//  NFHomeViewCollectionCellViewModel.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 20.01.2024.
//

import UIKit

protocol NFHomeViewCollectionCellViewModelProtocol{
    func update(items : [NFMovieModel])
}


final class NFHomeViewCollectionCellViewModel :NSObject{
    
    public var items  = [NFMovieModel]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: NFHomeViewCollectionViewCellView.identifier, for: indexPath) as? NFHomeViewCollectionViewCellView else {fatalError("Unsupported cell")}
        cell.configure(movie: items[indexPath.row])
        return cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    
}

extension NFHomeViewCollectionCellViewModel : UICollectionViewDelegate,UICollectionViewDataSource{}

extension NFHomeViewCollectionCellViewModel  : NFHomeViewCollectionCellViewModelProtocol{
    func update(items: [NFMovieModel]) {
        self.items = items
    }
    
}
