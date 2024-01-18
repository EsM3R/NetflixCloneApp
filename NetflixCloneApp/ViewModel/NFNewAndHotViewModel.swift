//
//  NFNewAndHotViewModel.swift
//  NetflixCloneApp
//
//  Created by Mehmet Vural on 18.01.2024.
//

import UIKit

final class NFNewAndHotViewModel : NSObject{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NFNewAndHotTableViewCell.identifer, for: indexPath) as?  NFNewAndHotTableViewCell else {fatalError()}
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height =  UIScreen.main.bounds.height
        return height * 0.45
    }
    
}

extension NFNewAndHotViewModel : UITableViewDataSource , UITableViewDelegate{}
