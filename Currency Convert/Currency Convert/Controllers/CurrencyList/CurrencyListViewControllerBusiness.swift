//
//  CurrencyListViewControllerBusiness.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

protocol CurrencyListViewControllerBusinessDelegate: class {
    func didFetchCurrencies()
}

class CurrencyListViewControllerBusiness: NSObject {
    
    var currencyList: CurrencyListModel
    var delegate: CurrencyListViewControllerBusinessDelegate?
    var ratesArray: NSMutableArray
    var baseRate: RateModel
    
    override init() {
        self.currencyList = CurrencyListModel.init()
        self.ratesArray = NSMutableArray()
        baseRate = RateModel()
        baseRate.currency = "CAD"
        baseRate.value = 1
        super.init()
        self.fetchCurrencies()
    }
    
    func fetchCurrencies() {
        CurrencyNetworking().getCurrencyList(for: self.baseRate.currency, completion: {(result) in
            switch result {
            case .success(let currencies):
                self.currencyList = currencies
                self.startRatesArray(withCurrenciesList: currencies)
                self.delegate?.didFetchCurrencies()
                break
            case .failure( _):
                break
            }
        })
    }
    
    private func startRatesArray(withCurrenciesList currenciesList: CurrencyListModel) {
        self.ratesArray.removeAllObjects()
        for rate in currenciesList.rates{
            self.ratesArray.add(RateModel.init(withKey:rate.key, andValue:rate.value))
        }
    }
    
    func currencyCell(_ cell: CurrencyListTableViewCell, forIndexPath indexPath: IndexPath) -> CurrencyListTableViewCell {
        let rate = self.ratesArray[indexPath.row] as! RateModel
        cell.currencyLabel.text = rate.currency
        cell.currencyValueLabel.text = String().doubleString(rate.value * self.baseRate.value)
        return cell
    }
    
}
