//
//  toSecondPAge.swift
//  JSonWithTableView
//
//  Created by Cüneyt ALSU on 17.12.2021.
//

import Foundation
import UIKit

class SecondPage: UIViewController {
    var value = 0.0
    @IBOutlet weak var currencyLabel: UILabel!
    func configure(menu: Menu) {
        value = menu.value
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        currencyLabel.text = String(value)
    }
}



