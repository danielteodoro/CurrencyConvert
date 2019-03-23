//
//  SettingsViewController.swift
//  Currency Convert
//
//  Created by Daniel Teodoro on 23/03/19.
//  Copyright © 2019 Daniel Teodoro. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func didUpdateSettings(withBaseRate baseRate: RateModel)
}

class SettingsViewController: UIViewController {
    
    var delegate: SettingsViewControllerDelegate?
    @IBOutlet weak var currentCurrencyTextfield: UITextField!
    @IBOutlet weak var valueTextfield: UITextField!
    var baseRate = RateModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.currentCurrencyTextfield.text = baseRate.currency
        self.valueTextfield.text = String().doubleString(baseRate.value)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let rate = RateModel()
        rate.currency = self.currentCurrencyTextfield.text!
        rate.value = self.valueTextfield.text!.doubleValue()
        
        self.delegate?.didUpdateSettings(withBaseRate: rate)
    }
    
    func setup(withBaseRate baseRate:RateModel) {
        self.baseRate = baseRate
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
