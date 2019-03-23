//
//  CurrencyListModel.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

class CurrencyListModel: NSObject, Codable {
    let base: String!
    let date: String!
    var rates: [String:Double]
    
    public override init () {
        base = String()
        date = String()
        rates = [String:Double]()
    }
}
