//
//  ViewControllerTableViewExtension.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postUserViewModel.postViewModel.postDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.reuseIdentifier, for: indexPath) as? PostTableViewCell)!
        var dataSource = postUserViewModel.postViewModel.postDataSource[indexPath.row]
        dataSource.userName = postUserViewModel.getUserNameByID(for: dataSource.userId ?? 0)
        
        cell.configure(with: dataSource)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var dataSource = postUserViewModel.postViewModel.postDataSource[indexPath.row]
        dataSource.userName = postUserViewModel.getUserNameByID(for: dataSource.userId ?? 0)
        let vc = DetailPostViewController()
        vc.detailViewModel.detailDataSource = dataSource
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
