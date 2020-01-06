//
//  ContentView.swift
//  CalculatorSwiftUI
//
//  Created by Alexander Römer on 06.01.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct CalculatorView: View {
    
    @ObservedObject var calculatorVM = CalculatorViewModel()
    
    private let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equals]
    ]
    
    private let spacing: CGFloat = 12
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(spacing: self.spacing) {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(self.calculatorVM.display)
                            .foregroundColor(.white)
                            .font(.system(size: 74))
                            .multilineTextAlignment(.trailing)
                    }
                    .padding(.horizontal, self.spacing)
                    
                    ForEach(self.buttons, id: \.self) { row in
                        CalculatorButtonsRow(screenWidth: geometry.size.width, spacing: self.spacing, buttons: row, pressedOperator: self.calculatorVM.pressedOperator, didTapButton: { calcButton in
                            self.calculatorVM.receiveButtonPress(button: calcButton)
                        })
                    }
                }
            }
        }
    }
}
