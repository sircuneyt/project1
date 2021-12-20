//
//  ViewController.swift
//  JSonWithTableView
//
//  Created by Cüneyt ALSU on 16.12.2021.
//

import UIKit
import Foundation

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var chooseData = Menu.GBP
    @IBOutlet weak var tableView: UITableView!
    {
        didSet {
            //ram de yer ayırmak için kullanılır.
            tableView.register(UINib(nibName: "imageViewController", bundle: nil), forCellReuseIdentifier: "imageViewController")
        }
    }
        override func viewDidLoad() {
        super.viewDidLoad()
     }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: imageViewController.reuseIdentifier, for: indexPath) as! imageViewController
//        cell.configure(menu: Menu.allCases[indexPath.row])
//        return cell
     let cell = tableView.dequeueReusableCell(withIdentifier: "imageViewController", for: indexPath) as! imageViewController
        cell.configure(menu: Menu.allCases[indexPath.row])
        return cell
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooseData = Menu.allCases[indexPath.row]
        print(chooseData)
       
        performSegue(withIdentifier: "toSecondPage", sender: nil)
       
        
//        let destinationVC = SecondPage()
//        destinationVC.configure(menu: chooseData)
//        self.present(destinationVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondPage"{
            let destinationVC = segue.destination as! SecondPage
            destinationVC.configure(menu: chooseData)
        }
    }

}

