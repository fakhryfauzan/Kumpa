//
//  AlbumDetailViewControllerTableView.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
import UIKit

extension AlbumDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumDetailVIewModel.dataSource.photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.reuseIdentifier, for: indexPath) as! PhotoTableViewCell
        if let dataSource = albumDetailVIewModel.dataSource.photos?[indexPath.row] {
            cell.configure(with: dataSource)
        }
        return cell
    }
    
    
}
