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
    
    override init() {
        self.currencyList = CurrencyListModel.init()
        self.ratesArray = NSMutableArray()
        super.init()
        self.fetchCurrencies()
    }
    
    func fetchCurrencies() {
        CurrencyNetworking().getCurrencyList(for: "CAD", completion: {(result) in
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
    
    private func startRatesArray(withCurrenciesList currenciesList: CurrencyListModel){
        for rate in currenciesList.rates{
            self.ratesArray.add(RateModel.init(withKey:rate.key, andValue:rate.value))
        }
    }
    
}
