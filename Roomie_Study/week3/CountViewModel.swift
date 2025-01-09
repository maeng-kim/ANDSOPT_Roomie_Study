//
//  CountViewModel.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/9/25.
//
import Foundation

final class CountViewModel {
    var isValid: ((Bool) -> Void) = { _ in }
    
    func isNumberValid(num: Int) -> Bool {
        let validNum = num >= 0
        isValid(validNum)
        return validNum
    }
}
