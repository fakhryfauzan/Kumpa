//
//  UserTableViewCell.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import UIKit

class UserTableViewCell: UITableViewCell, CellConfigure {
    static var reuseIdentifier = "UserTableViewCell"
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailPhoneLabel: UILabel!
    @IBOutlet weak var albumsLabel: UILabel!
    
    
    func configure(with dataSource: Any) {
        if let dataSource = dataSource as? UserModel {
            userNameLabel.text = dataSource.name
            emailPhoneLabel.text = "Email : \(dataSource.email ?? ""), Password : \(dataSource.phone ?? "")"
            albumsLabel.text = "HighLight Albums : \n \(dataSource.first3Albums?[0].title ?? "") \n \(dataSource.first3Albums?[1].title ?? "") \n \(dataSource.first3Albums?[2].title ?? "")"
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "UserTableViewCell", bundle: nil)
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
