//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    //MARK: - Properties
    var calculatorBrain = CalculatorBrain()
    
    //MARK: - Outlets
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        displayHeight(hSlider: sender)
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        displayWeight(wSlider: sender)
    }
    
    @IBAction func calculateTapped(_ sender: UIButton) {
        calculateBMI()
    }
    
    //MARK: - Helper Functions
    func displayHeight(hSlider: UISlider) {
        let height = (String(format: "%.2f", hSlider.value))
        heightLabel.text = "\(height)m"
    }
    
    func displayWeight(wSlider: UISlider) {
        let weight  = (String(format: "%.0f", wSlider.value))
        weightLabel.text = "\(weight)Kg"
    }
    
    func calculateBMI() {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            guard  let destinationVC = segue.destination as? ResultsViewController else { return }
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}//END OF CLASS

