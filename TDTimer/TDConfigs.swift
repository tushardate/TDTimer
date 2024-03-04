//
//  TDConfigs.swift
//  TDTimer
//
//  Created by TUSHAR DATE on 3/5/24.
//

import SwiftUI


struct Config {
    static let spacing: CGFloat = 5
    static let cornerRadius: CGFloat = 10
    static let timerDisplayHeight: CGFloat = UIScreen.main.bounds.height * 1/4
    static let resetButtonHeight: CGFloat = UIScreen.main.bounds.height * 1/10
    static var buttonHeight: CGFloat {
        let bottomSectionHeight = UIScreen.main.bounds.height - timerDisplayHeight - resetButtonHeight
        let rows = 3
        return bottomSectionHeight / (CGFloat(rows) + 1)
    }
}
