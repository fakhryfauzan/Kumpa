//
//  DetailPostViewControllerTableView.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
import UIKit
extension DetailPostViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel.detailDataSource.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.reuseIdentifier, for: indexPath) as! CommentTableViewCell
        if let dataSource = detailViewModel.detailDataSource.comments?[indexPath.row] {
            cell.configure(with: dataSource)
        }
        
        return cell
    }
    
    
}
