//
//  UsersViewControllerConfigure.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

extension UsersViewController: ViewConfiguration {
    func initialConfigure() {
        photoUserViewModel.responseDelegate = self
        photoUserViewModel.getData()
        
        userTableView.register(UserTableViewCell.nib(), forCellReuseIdentifier: UserTableViewCell.reuseIdentifier)
        
        self.navigationItem.title = "Users"
    }
    
    
}
