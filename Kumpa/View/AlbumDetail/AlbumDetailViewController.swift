//
//  AlbumDetailViewController.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import UIKit

final class AlbumDetailViewController: UIViewController {

    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var photoTableView: UITableView!
    
    var albumDetailVIewModel = AlbumDetailVIewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialConfigure()
        // Do any additional setup after loading the view.
    }


}
