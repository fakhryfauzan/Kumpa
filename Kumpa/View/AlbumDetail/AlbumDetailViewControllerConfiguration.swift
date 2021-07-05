//
//  AlbumDetailViewControllerConfiguration.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

extension AlbumDetailViewController: ViewConfiguration {
    func initialConfigure() {
        albumTitleLabel.text = albumDetailVIewModel.dataSource.title
        photoTableView.register(PhotoTableViewCell.nib(), forCellReuseIdentifier: PhotoTableViewCell.reuseIdentifier)
        photoTableView.reloadData()
        
        self.title = albumDetailVIewModel.dataSource.title
    }
    
}
