//
//  CommentTableViewCell.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import UIKit

class CommentTableViewCell: UITableViewCell, CellConfigure {
    static var reuseIdentifier = "CommentTableViewCell"
    
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    func configure(with dataSource: Any) {
        if let dataSource = dataSource as? CommentModel {
            postedByLabel.text = "Posted By : + \(dataSource.name ?? "") "
            emailLabel.text = "Email : + \(dataSource.email ?? "") "
            bodyLabel.text = dataSource.body
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "CommentTableViewCell", bundle: nil)
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
