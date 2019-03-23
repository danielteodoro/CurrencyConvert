//
//  CurrencyListViewController.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

class CurrencyListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CurrencyListViewControllerBusinessDelegate {
    
    @IBOutlet var tableView: UITableView!
    var business: CurrencyListViewControllerBusiness = CurrencyListViewControllerBusiness()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationItem.title = "CAD($1,00)"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib.init(nibName: "CurrencyListTableViewCell", bundle: nil), forCellReuseIdentifier: "currencyListCell")
        business.delegate = self
    }
    
    //MARK: - BusinessDelegate
    func didFetchCurrencies() {
        self.tableView.reloadData()
    }
    
    //MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.business.currencyList.rates.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "currencyListCell", for: indexPath) as! CurrencyListTableViewCell
        let rate = self.business.ratesArray[indexPath.row] as! RateModel
        cell.currencyLabel.text = rate.currency
        cell.currencyValueLabel.text = String.init(format: "$%.02f", rate.value)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
