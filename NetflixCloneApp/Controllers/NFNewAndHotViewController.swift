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
        initService()
        
    }
    
    private func configureUI(){
        view.addSubviews(tableView)
        setUpNavigationBar()
        setUpAttributeTableView()
        setUpTableView()
    }
    
    private func initDelegate(){
        tableView.dataSource = viewModel
        tableView.delegate = viewModel
    }
    private func initService(){
        Service.shared.fetchNewsAndHotMovies { response in
            DispatchQueue.main.async {
                self.viewModel.update(items: response.results)
                self.tableView.reloadData()
            }
        } onFailure: { error in
            print(error.localizedDescription)
        }

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

extension NFNewAndHotViewController{
    private func setUpNavigationBar(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "NEWS & HOTS", style: .done, target: self, action: nil)
            
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                                                style: .done,
                                                                target: self,
                                                                action: nil)



        navigationController?.navigationBar.tintColor = UIColor.white
    }
    
}
