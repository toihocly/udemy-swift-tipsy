//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var billTotal: UITextField!
    @IBOutlet weak var tipZero: UIButton!
    @IBOutlet weak var tipTen: UIButton!
    @IBOutlet weak var tipTwenty: UIButton!
    @IBOutlet weak var membersCount: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    let tipBrain = TipBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        stepper.maximumValue = 12
//        stepper.minimumValue = 2
        stepper.value = 2
    }

    @IBAction func tipPress(_ sender: UIButton) {
        changeUITipButton(sender)
        if sender == tipZero {
            print(" tip 0")
            tipBrain.setTip(tip: 0)
        } else if sender == tipTen {
            print(" tip 10")
            tipBrain.setTip(tip: 10)
        } else {
            print(" tip 20")
            tipBrain.setTip(tip: 20)
            
        }
    }
    
    @IBAction func handleStepper(_ sender: UIStepper) {
    }
    
    @IBAction func changeMembers(_ sender: UIStepper) {
        print(sender.value)
        tipBrain.setMembers(membersCount: Int(sender.value))
        membersCount.text = String(format: "%i", Int(sender.value))
    }
    
    @IBAction func calculate(_ sender: Any) {
        tipBrain.setTotalBill(total: (billTotal.text! as NSString).floatValue)
        tipBrain.caculator()
        print(tipBrain.getTotalBill())
        print(tipBrain.getMembers())
        print(tipBrain.getTip())
        print(tipBrain.getSlip())
        if tipBrain.tipValue?.slip != 0 {
            performSegue(withIdentifier: "tipDetails", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tipDetails" {
            let viewController = segue.destination as? DetailsViewController
            viewController?.tip = tipBrain.tipValue
        }
    }
    
    // MARK: change UI
    func changeUITipButton(_ selectedButton: UIButton ) {
        tipZero.isSelected = false
        tipTen.isSelected = false
        tipTwenty.isSelected = false
        
        selectedButton.isSelected = true
    }
    
    
}

