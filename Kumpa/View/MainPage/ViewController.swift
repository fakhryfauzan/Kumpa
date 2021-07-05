//
//  ViewController.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 04/07/21.
//

import UIKit

class ViewController: UIViewController, ResponseForViewDelegate {
    func getResponse(response: Any?) {
        DispatchQueue.main.async {
            self.postTableView.reloadData()
        }
    }
    

    @IBOutlet weak var postTableView: UITableView!
    let postUserViewModel = PostUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialConfigure()
        // Do any additional setup after loading the view.
    }


}

