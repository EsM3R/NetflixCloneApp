//
//  NFHomeViewViewModel.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 17.01.2024.
//

import UIKit

class ServiceViewModel {
    
    func fetchData(for section: Int, completion: @escaping ([NFMovieModel]) -> Void) {
        var servicePath: ServicePath
        
        switch section {
        case 0:
            servicePath = .TRENDING_MOVIE
        case 1:
            servicePath = .TRENDING_TV
        case 2:
            servicePath = .NEW_AND_HOT
        case 3:
            servicePath = .POPULAR
        case 4:
            servicePath = .TOP_RATED
        default:
            return
        }
        
        NFService.shared.fetchData(request: servicePath.withBaseUrl(), expecting: NFResponseTrendingMovie.self) { [weak self] response in
            guard let self = self else { return }
            completion(response.results)
        } onFailure: { error in
            print(error.localizedDescription)
        }
    }
}


final class NFHomeViewViewModel : NSObject{
    
   
    
    private let sectionTitles = ["Trending movies", "Trending Tv", "Popular","Upcoming" , "Top Rated"]
    
    private let  viewModel = ServiceViewModel()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NFHomeViewTableViewCell.identifier, for: indexPath)  as? NFHomeViewTableViewCell else {fatalError("Unsupported cell")}
        
        viewModel.fetchData(for: indexPath.section) { items in
            cell.update(items: items)
        }
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as?  UITableViewHeaderFooterView else {return }
        headerView.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        headerView.textLabel?.textColor = UIColor.white
        headerView.textLabel?.text = headerView.textLabel?.text?.capitalized
        
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle =  sectionTitles[section]
        return sectionTitle
    }
}

extension NFHomeViewViewModel :  UITableViewDataSource,UITableViewDelegate {} 

