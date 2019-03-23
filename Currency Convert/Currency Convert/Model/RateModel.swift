//
//  RateModel.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

class RateModel: NSObject {
    var currency = String()
    var value = Double()
    
    convenience init(withKey key:String, andValue value:Double) {
        self.init()
        currency = key
        self.value = value
    }
}
