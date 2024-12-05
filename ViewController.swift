//
//  ViewController.swift
//  EmiCalculator
//
//  Created by ie16 on 19/10/24.
//  Created by shyam karma

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calButton: UIButton!
    @IBOutlet weak var ResultLable: UILabel!
    @IBOutlet weak var TenureTextField: UITextField!
    @IBOutlet weak var InterestTextField: UITextField!
    @IBOutlet weak var AmountValue: UITextField!
    @IBOutlet weak var sliderAmount: UISlider!
    @IBOutlet weak var interestSlider: UISlider!
    @IBOutlet weak var TenureSlider: UISlider!
    @IBOutlet weak var AmountStepper: UIStepper!
    @IBOutlet weak var InterestStepper: UIStepper!
    @IBOutlet weak var TenureStepper: UIStepper!
    @IBOutlet weak var InterestAmountValue: UITextField!
    @IBOutlet weak var interestslidervalue: UISlider!
    @IBOutlet weak var yearAmount: UITextField!
    @IBOutlet weak var yearsliderAmount: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: IBAction:
    @IBAction func AmountSliderChanges(_ sender: UISlider) {
        
        let currentValue = Int(sliderAmount.value)
        AmountValue.text = "\(currentValue)"
    }
    @IBAction func InterestSliderValue(_ sender: UISlider) {
        let currentValue = Int(interestslidervalue.value)
        InterestAmountValue.text = "\(currentValue)"
    }
    
    @IBAction func yearslidervalue(_ sender: UISlider) {
        let currentValue = Int(yearsliderAmount.value)
        yearAmount.text = "\(currentValue)"
    }
    @IBAction func textvaluechange(_ sender: UITextField) {
        if let value = sender.text {
            if let final = Float(value) {
                sliderAmount.value = final
                AmountStepper.value = Double(final)
            }
        }
    }
    @IBAction func interesttextvalue(_ sender: UITextField) {
        if let value = sender.text {
            if let x = Float(value) {
                interestSlider.value = x
                InterestStepper.value = Double(x)
            }
        }
    }
    @IBAction func tenuretextfeild(_ sender: UITextField) {
        if let value = sender.text {
            if let x = Float(value) {
                yearsliderAmount.value = x
                TenureStepper.value = Double(x)
            }
        }
    }
    @IBAction func AmountStipper(_ sender: UIStepper) {
        let value = sender.value
        let amountvalue = Int(value)
        AmountValue.text = String(amountvalue)
        sliderAmount.value = Float(value)
    }
    @IBAction func InterestStepper(_ sender: UIStepper) {
        let Interestvalue = sender.value
        InterestTextField.text = String(Interestvalue)
        interestSlider.value = Float(Interestvalue)
        
    }
    @IBAction func TenureStepper(_ sender: UIStepper) {
        let Tenurevalue = sender.value
        let result = Int(Tenurevalue)
        TenureTextField.text = String(result)
        TenureSlider.value = Float(Tenurevalue)
    }
    @IBAction func calButton(_ sender: UIButton) {
        guard let amountText = AmountValue.text, let amount = Double(amountText), let interestText = InterestTextField.text, let interest =  Double(interestText), let yearText = TenureTextField.text, let year = Double(yearText)  else {
            return
        }
        let interestValue = (interest / 12 ) / 100
        let month =  year * 12
        let multi = amount * interestValue
        let powered = pow(1 + interestValue, month)
        let total = multi * powered
        let x = (pow(1 + interestValue, month) - 1)
        let answer = total / x
        ResultLable.text = String(answer)
        
    }
}


