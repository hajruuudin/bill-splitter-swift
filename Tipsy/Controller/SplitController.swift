//
//  SplitController.swift
//  Tipsy
//
//  Created by Hajrudin Imamovic on 02/02/2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class SplitController: UIViewController {
    var totalIndividualBill = "0.0"
    var numOfPeople = "2"
    var tipPercentage = "0.0"

    @IBOutlet weak var totalIndividualLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        totalIndividualLabel.text = totalIndividualBill
        explanationLabel.text = "Split evenly among \(numOfPeople) people, with tip of \(tipPercentage). Pay Up!"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
