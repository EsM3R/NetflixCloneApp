//
//  NFNewAndHotViewModel.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 18.01.2024.
//

import UIKit

protocol NFNewAndHotViewModelProtocol{
    func update(items : [NFMovieModel])
}
protocol NFNewAndHotViewModelDelegate : AnyObject{
    func didSelectMovie(movie : NFMovieModel)
}


final class NFNewAndHotViewModel : NSObject{
    
    private var items  : [NFMovieModel] = [NFMovieModel]()
    
    public weak var delegate : NFNewAndHotViewModelDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NFNewAndHotTableViewCell.identifer, for: indexPath) as?  NFNewAndHotTableViewCell else {fatalError()}
        cell.configure(movie: items[indexPath.row])
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height =  UIScreen.main.bounds.height
        return height * 0.4
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = items[indexPath.row]
        delegate?.didSelectMovie(movie: movie)
    }
    
}

extension NFNewAndHotViewModel : UITableViewDataSource , UITableViewDelegate{}


extension NFNewAndHotViewModel : NFNewAndHotViewModelProtocol{
    func update(items: [NFMovieModel]) {
        self.items = items
       
    }
}

