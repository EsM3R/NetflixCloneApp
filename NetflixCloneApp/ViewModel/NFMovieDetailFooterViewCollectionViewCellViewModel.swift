//
//  NFMovieDetailFooterViewCollectionViewCellViewModel.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 20.01.2024.
//

import UIKit


final class NFMovieDetailFooterViewCollectionViewCellViewModel : NSObject{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .cyan
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width =  (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
    
    
}


extension NFMovieDetailFooterViewCollectionViewCellViewModel : UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

}
