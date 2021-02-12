//
//  BMIResultsViewController.swift
//  BMI Calculator
//
//  Created by Deven Day on 2/12/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - Properties
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    //MARK: - Outlets
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Actions
    @IBAction func recalculateTapped(_ sender: UIButton) {
        recalculateResults()
    }
    
    //MARK: - Helper Functions
    func setupViews() {
        setBMI()
        setBMIColor()
        setAdviceLabel()
    }
    
    func setBMI() {
        bmiLabel.text = bmiValue
    }
    
    func setAdviceLabel() {
        adviceLabel.text = advice
    }
    
    func setBMIColor() {
        view.backgroundColor = color
    }
    
    func recalculateResults() {
        self.dismiss(animated: true, completion: nil)
    }
}//END OF CLASS
