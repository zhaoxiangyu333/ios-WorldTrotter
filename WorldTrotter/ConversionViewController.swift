//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by hadoop on 2018/4/25.
//  Copyright © 2018年 hadoop. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func editingChange(_ sender: UITextField) {
        if let text = sender.text, let value = Double(text) {
            fahrenheitValue = value
        }
    }
    
    @IBAction func dismissKeyBoard(_ sender: AnyObject){
        textField.resignFirstResponder()
    }
    
    var fahrenheitValue: Double? {
        didSet{
            updataCelsiusValue()
        }
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var celsiusValue: Double? {
        if let value = fahrenheitValue{
            return (value - 32) * (5 / 9)
        } else {
            return nil
        }
    }
    
    func updataCelsiusValue() {
        if let value = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: value))
        }
    }
}
