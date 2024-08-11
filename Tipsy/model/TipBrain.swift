//
//  TipBrain.swift
//  Tipsy
//
//  Created by PC Admin on 15/07/2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

class TipBrain {
    
    var tipValue: Tip?
    
    init() {
        self.tipValue = Tip(total: 0, members: 2, tip: 0, slip: 0)
    }
    
    func setTotalBill(total: Float) {
        self.tipValue?.total = total
    }
    
    func setMembers(membersCount: Int) {
        self.tipValue?.members = membersCount
    }
    
    func setTip(tip: Int) {
        self.tipValue?.tip = tip
    }
    
    func caculator() {
        if let safeTipValue = tipValue {
            let totals = (safeTipValue.total + (safeTipValue.total * Float(safeTipValue.tip)/100)) / Float(safeTipValue.members)
            
            tipValue?.slip = totals
        }
    }
    
    func getTotalBill() -> String {
        return String(format: "%.1f", tipValue?.total ?? 0)
    }
    
    func getMembers() -> String {
        return String(format: "%i", tipValue?.members ?? 0)
    }
    
    func getTip() -> String {
        return String(format: "%i", tipValue?.tip ?? 0)
    }
    
    func getSlip() -> String {
        return String(format: "%.1f", tipValue?.slip ?? 0)
    }
}
