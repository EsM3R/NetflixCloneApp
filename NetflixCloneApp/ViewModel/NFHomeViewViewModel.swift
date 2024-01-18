//
//  NFHomeViewViewModel.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 17.01.2024.
//

import UIKit


final class NFHomeViewViewModel : NSObject{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "mehmet Vural"
        return cell
    }
}

extension NFHomeViewViewModel :  UITableViewDataSource,UITableViewDelegate {} 
