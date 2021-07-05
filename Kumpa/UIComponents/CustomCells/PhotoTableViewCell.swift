//
//  PhotoTableViewCell.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import UIKit

class PhotoTableViewCell: UITableViewCell, CellConfigure {
    static var reuseIdentifier = "PhotoTableViewCell"
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with dataSource: Any) {
        if let dataSource = dataSource as? PhotoModel {
            if let url = URL(string: dataSource.url ?? "") {
                photoImage.loadImage(imageURL: url, placeHolderImage: "placeHolder")
                titleLabel.text = dataSource.title
            }
            
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "PhotoTableViewCell", bundle: nil)
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
