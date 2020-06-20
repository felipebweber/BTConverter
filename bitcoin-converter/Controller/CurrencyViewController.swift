//
//  TableViewController.swift
//  bitcoin-converter
//
//  Created by Felipe Weber on 29/05/20.
//  Copyright © 2020 Felipe Weber. All rights reserved.
//

import UIKit
import StoreKit

final class CurrencyViewController: UITableViewController {
    
    private let coinManager = CoinManager()
    private let selectedCurrencyUserDefaults = SelectedCurrencyUserDefaults()
    private var arrayCurrency:[String] = []
//    var products = [SKProduct]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinManager.fetchCoinPrice()
        
        let update = selectedCurrencyUserDefaults.retriveHourUpdate()
        setTitleLocation(updateDate: update)
        coinManager.delegate = self
        
//        IAProducts.store.requestProducts { (status, products) in
//            if status {
//                guard let products = products else { return }
//                print("Name: \(products)")
//                self.products = products
//            }
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateData()
    }
    
    @IBAction func refreshControlValueChanged(_ sender: UIRefreshControl) {
        coinManager.fetchCoinPrice()
    }
    

//    @IBAction func buy(_ sender: Any) {
//        let menu = UIAlertController(title: "Compra", message: "Esta compra remove o banner", preferredStyle: .alert)
//        
//        let buy = UIAlertAction(title: "Buy", style: .default, handler: nil)
//        menu.addAction(buy)
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        menu.addAction(cancel)
//
//        self.present(menu, animated: true, completion: nil)
//    }
    
    

}

extension CurrencyViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as! CurrencyTableViewCell
        let currency = arrayCurrency[indexPath.row]
        let result = coinManager.retrieveData(currency: currency)
        guard let price = result?.price else { return cell }
        guard let symbol = result?.symbol else { return cell }
        let priceFormat = price.toCurrencyFormat()
        cell.symbolImageView.image = UIImage(imageLiteralResourceName: currency.lowercased())
        cell.setCurrencyLabel(currency, "\(symbol) \(priceFormat)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCurrency.count
    }
}

extension CurrencyViewController: CoinManagerDelegate {
    func didUpdateData() {
        updateData()
        refreshControl?.endRefreshing()
    }
    
    func didUpdateFail() {
        let title = NSLocalizedString("title", comment: "")
        let msg = NSLocalizedString("msg", comment: "")
        let cancel = NSLocalizedString("cancel", comment: "")
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let btcancel = UIAlertAction(title: cancel, style: .default, handler: nil)
        alertController.addAction(btcancel)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension CurrencyViewController {
    private func setTitle(title:String, subtitle:String) -> UIView {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -5, width: 0, height: 0))

        titleLabel.backgroundColor = UIColor.clear
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.text = title
        titleLabel.sizeToFit()

        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
        subtitleLabel.backgroundColor = UIColor.clear
        subtitleLabel.textColor = UIColor.white
        subtitleLabel.font = UIFont.systemFont(ofSize: 10)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)

        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width

        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }

        return titleView
    }
    
    private func setTitleLocation(updateDate: String) {
        let subtitle = NSLocalizedString("setsubtitle", comment: "")
        self.navigationItem.titleView = setTitle(title: "Bitcoin check", subtitle: "\(subtitle) \(updateDate)")
    }
    
    private func updateData() {
        let update = selectedCurrencyUserDefaults.retriveHourUpdate()
        setTitleLocation(updateDate: update)
        arrayCurrency = selectedCurrencyUserDefaults.retrive()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.reloadData()
    }
}

extension Double {
    func toCurrencyFormat() -> String {
        let currencyFormat = NumberFormatter()
        currencyFormat.usesGroupingSeparator = true
        currencyFormat.numberStyle = NumberFormatter.Style.decimal
        currencyFormat.locale = Locale.current
        guard let priceString = currencyFormat.string(from: NSNumber(value: self)) else { return ""}
        return priceString
    }
}
