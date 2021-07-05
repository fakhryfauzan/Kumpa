//
//  UserDetailViewControllerTableView.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
import UIKit

extension UserDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDetailViewModel.userDetailDataSource.albums?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.reuseIdentifier, for: indexPath) as! AlbumTableViewCell
        if let dataSource = userDetailViewModel.userDetailDataSource.albums?[indexPath.row]  {
            cell.configure(with: dataSource)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.width / 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AlbumDetailViewController()
        if let dataSource = userDetailViewModel.userDetailDataSource.albums?[indexPath.row] {
            vc.albumDetailVIewModel.dataSource = dataSource
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
