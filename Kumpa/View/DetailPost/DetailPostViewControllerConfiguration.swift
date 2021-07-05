//
//  DetailPostViewControllerConfiguration.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation

extension DetailPostViewController: ViewConfiguration {
    func initialConfigure() {
        
        self.title = "Post"
        
        titleLabel.text = detailViewModel.detailDataSource.title
        postedByLabel.text = "Posted By " + detailViewModel.detailDataSource.userName!
        bodyLabel.text = detailViewModel.detailDataSource.body!
        
        commentTableView.register(CommentTableViewCell.nib(), forCellReuseIdentifier: CommentTableViewCell.reuseIdentifier)
        commentTableView.reloadData()
    }
    
    
}
