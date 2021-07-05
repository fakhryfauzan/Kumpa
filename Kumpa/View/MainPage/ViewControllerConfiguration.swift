//
//  ViewControllerConfiguration.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

extension ViewController: ViewConfiguration {
    func initialConfigure() {
        postTableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.reuseIdentifier)
        postUserViewModel.responseDelegate = self
        postUserViewModel.getData()
        self.navigationItem.title = "Posts"
    }
}
