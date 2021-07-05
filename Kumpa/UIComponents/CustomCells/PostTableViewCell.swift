//
//  PostTableViewCell.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 04/07/21.
//

import UIKit

class PostTableViewCell: UITableViewCell, CellConfigure {
    static func nib() -> UINib {
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    
    static var reuseIdentifier = "PostTableViewCell"
    
    
    func configure(with dataSource: Any) {
        if let dataSource = dataSource as? PostModel {
            titleLabel.text = dataSource.title
            postedByLabel.text = "Posted By " + dataSource.userName!
            bodyLabel.text = dataSource.body
        }
    }
    

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
