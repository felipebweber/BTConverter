//
//  ViewController.swift
//  BTConverter
//
//  Created by Felipe Weber on 15/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit
import CoreData

class SelectorViewController: UIViewController {
    
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelCurency: UILabel!
    @IBOutlet weak var currencySelectorTableView: UITableView!
    @IBOutlet weak var updateDate: UILabel!
    
    var coinManager = CoinManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.delegate = self
//        currentPicker.delegate = self
//        currentPicker.dataSource = self
        currencySelectorTableView.dataSource = self
        
        coinManager.fetchCoinPrice()
        updateDate.text = "Atualizado as: \(getHour(Date()))"
    }
    
    func getHour(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .long
        dateFormatter.locale = Locale.current
        return dateFormatter.string(from: date)
    }
    
}


extension SelectorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellIdentifier")
        cell.textLabel?.text = "Que delicinha"
        return cell
    }
}

extension SelectorViewController: CoinManagerDelegate {
    func didUpdatePrice(price: String, currency: String) {
        DispatchQueue.main.async {
            self.labelPrice.text = price
            self.labelCurency.text = currency
        }
    }
}
