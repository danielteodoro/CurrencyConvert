//
//  String+Helpers.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

extension String {
    
    func doubleString(_ value:Double) -> String {
        return String.init(format: "$%.2f", value)
    }
    
    mutating func doubleValue() -> Double {
        self = self.filter{ "0123456789.".contains($0) }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let numberFrance2 = formatter.number(from: self)
        return (numberFrance2?.doubleValue) ?? 0
    }
}
