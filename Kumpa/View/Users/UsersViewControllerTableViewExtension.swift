//
//  UsersViewControllerTableViewExtension.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
import UIKit

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoUserViewModel.userViewModel.userDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.reuseIdentifier, for: indexPath) as! UserTableViewCell
        let dataSource = photoUserViewModel.userViewModel.userDataSource[indexPath.row]
        cell.configure(with: dataSource)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UserDetailViewController()
        let dataSource = photoUserViewModel.userViewModel.userDataSource[indexPath.row]
        vc.userDetailViewModel.userDetailDataSource = dataSource
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
