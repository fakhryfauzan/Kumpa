//
//  AlbumTableViewCell.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import UIKit

class AlbumTableViewCell: UITableViewCell, CellConfigure {
    static var reuseIdentifier = "AlbumTableViewCell"
    @IBOutlet weak var albumTitleLabel: UILabel!
    
    @IBOutlet var images: [UIImageView]!
    
    func configure(with dataSource: Any) {
        if let dataSource = dataSource as? AlbumModel {
            albumTitleLabel.text = dataSource.title
            for (index, image) in images.enumerated() {
                if let url = URL(string: dataSource.first3Photos?[index].thumbnailUrl ?? "") {
                    image.loadImage(imageURL: url, placeHolderImage: "placeHolder")
                }
            }
        }
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "AlbumTableViewCell", bundle: nil)
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
