//
//  CurrencyNetworking.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

class CurrencyNetworking: URLSession {
    
    enum Result<Value> {
        case success(Value)
        case failure(Error)
    }
    
    func getCurrencyList(for baseCurrency: String, completion: ((Result<CurrencyListModel>) -> Void)?) {        
        var request = URLRequest(url:Endpoints().latestEndpoint(withBase: baseCurrency))
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            DispatchQueue.main.async {
                if let error = responseError {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    
                    do {
                        let posts = try decoder.decode(CurrencyListModel.self, from: jsonData)
                        completion?(.success(posts))
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    completion?(.failure(error))
                }
            }
        }
        
        task.resume()
    }

}
