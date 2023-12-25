//
//  BudgetVC.swift
//  ForTestCode
//
//  Created by Dev on 25/12/2566 BE.
//

import Foundation
import UIKit

class BudgetVC:UIViewController{
    
    var todayRemainingLabel:UILabel!
    var weeklyRemainingLabel:UILabel!
    var transactionTF:UITextField!
    var totalBudgetTF:UITextField!
    
    var budget:Budget!
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        setupView()
    }
    
    func setupView(){
        totalBudgetTF = UITextField(frame: CGRect(x: 5, y: self.getNavigationBarHeight() + self.getStatusBarHeight(), width: self.view.frame.width - 10, height: 50))
        self.view.addSubview(totalBudgetTF)
        totalBudgetTF.placeholder = "Total Budget"
        totalBudgetTF.delegate = self
        totalBudgetTF.layer.borderWidth = 1
        totalBudgetTF.layer.borderColor = UIColor.black.cgColor
        
        weeklyRemainingLabel = UILabel(frame: CGRect(x: 5, y: totalBudgetTF.frame.origin.y + 50 + 8, width: (self.view.frame.width/2)-10, height: 50))
        self.view.addSubview(weeklyRemainingLabel)
        weeklyRemainingLabel.text = "Left This Weak:"
        weeklyRemainingLabel.numberOfLines = 0
        weeklyRemainingLabel.layer.borderWidth = 1
        weeklyRemainingLabel.layer.borderColor = UIColor.black.cgColor
        
        todayRemainingLabel = UILabel(frame: CGRect(x: weeklyRemainingLabel.frame.origin.x + weeklyRemainingLabel.frame.width + 10, y: totalBudgetTF.frame.origin.y + 50 + 8, width: (self.view.frame.width/2)-10, height: 50))
        self.view.addSubview(todayRemainingLabel)
        todayRemainingLabel.text = "Left Today:"
        todayRemainingLabel.numberOfLines = 0
        todayRemainingLabel.layer.borderWidth = 1
        todayRemainingLabel.layer.borderColor = UIColor.black.cgColor
        
        transactionTF = UITextField(frame: CGRect(x: 5, y: weeklyRemainingLabel.frame.origin.y + weeklyRemainingLabel.frame.height + 8, width: self.view.frame.width - 10, height: 50))
        self.view.addSubview(transactionTF)
        transactionTF.delegate = self
        transactionTF.placeholder = "Spend:"
        transactionTF.layer.borderWidth = 1
        transactionTF.layer.borderColor = UIColor.black.cgColor
    }
}

extension BudgetVC:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let total = Decimal(string: textField.text ?? "")else{
            return true
        }
        
        if textField == totalBudgetTF{
            budget = Budget(total: total)
        }else if textField == transactionTF{
            budget.addTransaction(amount: total, timestamp: Date())
        }
        
        updateBudget()
        return true
    }
    
    func updateBudget(){
        weeklyRemainingLabel.text = budget.weeklyRemaining.moneyString
        todayRemainingLabel.text = budget.dailyRemaining.moneyString
    }
}
