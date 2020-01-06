//
//  CalculatorViewModel.swift
//  CalculatorSwiftUI
//
//  Created by Alexander Römer on 06.01.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    
    @Published var display = CalculatorViewModel.defaultDisplay
    @Published var pressedOperator = ""
    
    static let defaultDisplay    = "0"
    private var firstExpression  = ""
    private var secondExpression = ""
    
    internal func receiveButtonPress(button: CalculatorButton) {

        if button.title == "AC" {
            display = CalculatorViewModel.defaultDisplay
            firstExpression  = ""
            secondExpression = ""
            pressedOperator  = ""
            return
        }
        
        if button.title == "+" || button.title == "x" || button.title == "-" || button.title == "÷" {
            pressedOperator = button.title
            return
        }
        
        if button.title == "=" {
            let first = Int(firstExpression) ?? 0
            let second = Int(display) ?? 0
            
            if pressedOperator == "+" {
                display = "\(first + second)"
            } else if pressedOperator == "-" {
                display = "\(first - second)"
            } else if pressedOperator == "x" {
                display = "\(first * second)"
            } else if pressedOperator == "÷" {
                display = "\(first / second)"
            }
            
            firstExpression = display
            secondExpression = ""
            pressedOperator = ""
            
            return
        }
        
        if pressedOperator.isEmpty {
            if display == CalculatorViewModel.defaultDisplay {
                display = button.title
            } else {
                display += button.title
            }
            firstExpression = display
        } else {
            if secondExpression.isEmpty {
                display = button.title
            } else {
                display += button.title
            }
            secondExpression = display
        }
    }
}
