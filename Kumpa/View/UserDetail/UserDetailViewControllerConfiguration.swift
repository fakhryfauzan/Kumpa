//
//  UserDetailViewControllerConfiguration.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

extension UserDetailViewController: ViewConfiguration {
    func initialConfigure() {
        let dataSource = userDetailViewModel.userDetailDataSource
        userNameLabel.text = dataSource.name
        companyLabel.text = dataSource.company?.name
        emailPhoneLabel.text = "Email : \(dataSource.email ?? ""), Phone : \(dataSource.phone ?? "")"
        addressLabel.text = "\(dataSource.address?.street ?? ""), \(dataSource.address?.suite ?? "")"
        
        albumTableView.register(AlbumTableViewCell.nib(), forCellReuseIdentifier: AlbumTableViewCell.reuseIdentifier)
        self.title = dataSource.name
        albumTableView.reloadData()
        
    }
    
}
