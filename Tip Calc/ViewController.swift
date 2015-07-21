//
//  ViewController.swift
//  Tip Calc
//
//  Created by Jeremy McDonald on 2015-06-18.
//  Copyright (c) 2015 Jeremy McDonald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    
    @IBAction func calculateTapped(sender: AnyObject){
        tipCalc.total = Double ((totalTextField.text as NSString).doubleValue)
        
        let possibleTips = tipCalc.returnPossibleTips()
        var results = ""
        
        for (tipPct, tipValue) in possibleTips {
            results += "\(tipPct)%: \(tipValue)\n"
        }
        resultsTextView.text = results
    }
    
    @IBAction func taxPercentageChanges(sender: AnyObject){
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
    }
    
    @IBAction func viewTapped(sender: AnyObject){
        totalTextField.resignFirstResponder()
    }
    
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.13)
    
    func refreshUI(){
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        resultsTextView.text = ""

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

