//
//  CellConfigure.swift
//  Kumpa
//
//  Created by MNC BANK 2 on 04/07/21.
//

import Foundation
import UIKit
protocol CellConfigure {
    static var reuseIdentifier: String { get }
    func configure(with dataSource: Any)
    static func nib() -> UINib
}
