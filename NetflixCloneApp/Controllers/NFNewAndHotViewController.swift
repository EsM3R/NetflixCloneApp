//
//  NFNewAndHotViewController.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 17.01.2024.
//

import UIKit


class NFNewAndHotViewController: UIViewController {
    
    
    private let tableView : UITableView = UITableView()
    private let viewModel : NFNewAndHotViewModel = NFNewAndHotViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        initDelegate()
    }
    
    private func configureUI(){
        view.addSubviews(tableView)
        setUpAttributeTableView()
        setUpTableView()
    }
    
    private func initDelegate(){
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    

}


extension NFNewAndHotViewController {
    
    private func setUpAttributeTableView(){
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(NFNewAndHotTableViewCell.self , forCellReuseIdentifier: NFNewAndHotTableViewCell.identifer)
    }
    
 
}

// MARK: - Set up Constraints

extension NFNewAndHotViewController {
        
    private func setUpTableView(){
        
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor ),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
    
        ])
    }
}
