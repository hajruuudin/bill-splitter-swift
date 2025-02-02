//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    @IBOutlet weak var totalBillField: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    
    var splitCalculator = SplitCalculator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        splitCalculator.splitNumber = 2
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @IBAction func tipButtonPressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "0%" {
            zeroButton.isSelected = true
            tenButton.isSelected = false
            twentyButton.isSelected = false
            
            splitCalculator.tipPercentage = 0.0
        } else if sender.titleLabel?.text == "10%" {
            zeroButton.isSelected = false
            tenButton.isSelected = true
            twentyButton.isSelected = false
            
            splitCalculator.tipPercentage = 0.1
        } else {
            zeroButton.isSelected = false
            tenButton.isSelected = false
            twentyButton.isSelected = true
            
            splitCalculator.tipPercentage = 0.2
        }
    }
    
    @IBAction func stepperPress(_ sender: UIStepper) {
        let stepperValue = sender.value
        splitLabel.text = String(format: "%.0f", stepperValue)
        
        splitCalculator.splitNumber = Int(stepperValue)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "showSplit", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showSplit" {
            let destination = segue.destination as! SplitController
            if totalBillField.text != "" {
                splitCalculator.totalBill = Double(totalBillField.text!.replacingOccurrences(of: ",", with: "."))
                destination.totalIndividualBill = String(splitCalculator.calculateSplit())
                destination.numOfPeople = String(splitCalculator.splitNumber!)
                destination.tipPercentage = String(format: "%.1f", splitCalculator.tipPercentage!)
            }
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
}

