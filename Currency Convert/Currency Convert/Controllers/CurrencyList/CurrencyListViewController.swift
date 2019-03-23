//
//  CurrencyListViewController.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

class CurrencyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CurrencyListViewControllerBusinessDelegate, SettingsViewControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    var business: CurrencyListViewControllerBusiness = CurrencyListViewControllerBusiness()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        business.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "CurrencyListTableViewCell", bundle: nil), forCellReuseIdentifier: "currencyListCell")
        self.setTitle()
    }
    
    func setTitle() {
        self.navigationItem.title = String.init(format: "%@(%@)", self.business.baseRate.currency, String().doubleString(self.business.baseRate.value))
    }
    
    //MARK: - BusinessDelegate
    func didFetchCurrencies() {
        self.tableView.reloadData()
    }
    
    //MARK: - SettingsDelegate
    func didUpdateSettings(withBaseRate rate: RateModel) {
        self.business.baseRate = rate
        self.setTitle()
        self.business.fetchCurrencies()
    }
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.business.currencyList.rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: "currencyListCell", for: indexPath) as! CurrencyListTableViewCell
        cell = self.business.currencyCell(cell, forIndexPath: indexPath)
        
        return cell
    }
    
    // MARK: - Navigation
    @IBAction func openSettings(_ sender: Any) {
        self.performSegue(withIdentifier: "presentSettings", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "presentSettings" {
            (segue.destination as! SettingsViewController).delegate = self
            (segue.destination as! SettingsViewController).setup(withBaseRate: self.business.baseRate)
        }
    }

}
