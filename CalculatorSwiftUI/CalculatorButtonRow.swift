//
//  CalculatorButtonRow.swift
//  CalculatorSwiftUI
//
//  Created by Alexander Römer on 06.01.20.
//  Copyright © 2020 Alexander Römer. All rights reserved.
//

import SwiftUI

struct CalculatorButtonsRow: View {
    
    private(set) var screenWidth    : CGFloat
    internal let spacing            : CGFloat
    internal let buttons            : [CalculatorButton]
    internal let pressedOperator    : String
    internal var didTapButton       : (CalculatorButton) -> ()
    
    var body: some View {
        HStack (spacing: self.spacing) {
            ForEach(self.buttons) { button in
                Button(action: {
                    self.didTapButton(button)
                }, label: {
                    Text(button.title)
                        .font(.system(size: 28))
                        .frame(width: self.getButtonWidth(title: button.title),
                               height: (self.screenWidth - self.spacing * 5) / 4)
                        .foregroundColor(.white)
                        .background(button.backgroundColor)
                        .cornerRadius(100)
                })
            }
        }
    }
    
    func getButtonWidth(title: String) -> CGFloat {
        return title != "0" ?
            (self.screenWidth - self.spacing * 5) / 4 :
            (self.screenWidth - self.spacing * 5) / 4 * 2 + self.spacing
    }
    
}
