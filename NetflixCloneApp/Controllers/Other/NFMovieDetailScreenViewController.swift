//
//  NFMovieDetailScreenViewController.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 20.01.2024.
//

import UIKit

final class NFMovieDetailScreenViewController: UIViewController {
        
    private let tableView  : UITableView = UITableView()
    
    private let movie :  NFMovieModel
   
    private let headerView : UIView
    
    private let footerView = NFMovieDetailFooterViewCell()
    
    init(movie: NFMovieModel) {
        self.movie = movie
        self.headerView = NFMovieDetailHeaderView(frame: .zero, movie: movie)
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
     
    
    }
    
    private func configureUI(){
        view.addSubviews(tableView)
        setUpAttributeTableView()
        setUpTableView()
    }
    

}

// MARK: - Setup Attribute


extension NFMovieDetailScreenViewController{
    private func setUpAttributeTableView(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView =  headerView
        tableView.tableFooterView = footerView
        
    }
}


// MARK: - SetUp Constraints


extension NFMovieDetailScreenViewController{
    private func setUpTableView(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

