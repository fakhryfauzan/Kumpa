//
//  UsersViewController.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 05/07/21.
//

import Foundation
import UIKit

final class UsersViewController: UIViewController, ResponseForViewDelegate {
    func getResponse(response: Any?) {
        DispatchQueue.main.async {
            self.userTableView.reloadData()
        }
    }
    
    @IBOutlet weak var userTableView: UITableView!
    
    let photoUserViewModel = PhotoUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfigure()
        
    }
    
}
