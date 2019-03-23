//
//  Endpoints.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

class Endpoints: NSObject {
    
    func baseURLString() -> String! {
        return "https://api.exchangeratesapi.io/"
    }
    
    public func latestEndpoint(withBase base: String) -> URL {
        return URL.init(string: self.baseURLString()+"latest?base="+base)!
    }
}
