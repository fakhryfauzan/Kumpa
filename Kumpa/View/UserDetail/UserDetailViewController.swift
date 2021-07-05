//
//  UserDetailViewController.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import UIKit

class UserDetailViewController: UIViewController {
    
    var userDetailViewModel = UserDetailViewModel()
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var emailPhoneLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var albumTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialConfigure()
    }


}
