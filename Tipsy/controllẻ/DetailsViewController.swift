//
//  DetailsViewController.swift
//  Tipsy
//
//  Created by PC Admin on 11/08/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    
    var tip: Tip?
    
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView();
    }
    
    @IBAction func handleRecalculate(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - UI view
    func updateView() {
        if let tip = tip {
            splitLabel.text = String(format: "%.1f", tip.slip )
            descriptionLabel.text = String(format: "Split between %@ people, with %@%% tip.", String(tip.members), String(tip.tip))
        }
        
        
    }

}
