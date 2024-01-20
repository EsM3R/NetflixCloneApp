//
//  ViewController.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 17.01.2024.
//

import UIKit

class NFHomeViewController: UIViewController{
    
    
    private let viewModel : NFHomeViewViewModel = NFHomeViewViewModel()
    
    private let tableView : UITableView = UITableView()
    private let headerView : UIView = NFHomeViewHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 1.2))

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        initDelegate()

    }
    
    private func configureUI(){
        view.addSubviews( tableView)
        setUpNavigationBar()
        setUpTableView()
        setUpAttributeTableView()
        setUpHeaderView()
        setUpAttributeHeaderView()
    
    }
    
    private func initDelegate(){
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
    }
    
    private func initService(){
    
    }
    
    


}


// MARK: - Set up  Attribute

extension NFHomeViewController {
    
    private func setUpAttributeTableView(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NFHomeViewTableViewCell.self,
                           forCellReuseIdentifier: NFHomeViewTableViewCell.identifier)
        tableView.tableHeaderView = headerView
    }
    
    private func setUpAttributeHeaderView(){

        headerView.translatesAutoresizingMaskIntoConstraints = false
      
    }
}

// MARK: - Set up Constraints

extension NFHomeViewController {
    
    private func setUpHeaderView(){
        let width = UIScreen.main.bounds.width
        
        NSLayoutConstraint.activate([
        
            headerView.heightAnchor.constraint(equalToConstant: width * 1.25),
            headerView.widthAnchor.constraint(equalToConstant: width )
        
        ])
    }
    
    private func setUpTableView(){
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
      
        
        ])
    }
}


extension NFHomeViewController{
    private func setUpNavigationBar(){
        let leftIcon = UIImage(named: "netflix_logo")?.withRenderingMode(.alwaysOriginal)
            
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftIcon,
                                                               style: .done,
                                                               target: self,
                                                               action: nil)
            
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                                                style: .done,
                                                                target: self,
                                                                action: nil)

            
            
        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
}
