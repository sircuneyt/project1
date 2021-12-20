//
//  imageViewController.swift
//  JSonWithTableView
//
//  Created by Cüneyt ALSU on 16.12.2021.
//
import Foundation
import UIKit

class imageViewController: UITableViewCell {
    
        @IBOutlet weak var titleLabel: UILabel!
  
        func configure(menu: Menu) {
            titleLabel.text = menu.title
    }

}
