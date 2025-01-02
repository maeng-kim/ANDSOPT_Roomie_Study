//
//  LoginViewModel.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/1/25.
//
import Foundation

final class LoginViewModel {
    var isValid: ((Bool) -> Void)?
    
    func isLoginValid(id: String?, pw: String?) {
        guard let isValid, let id, let pw else { return }
        
        isValid(id.count >= 5 && pw.count >= 8)
    }
    
    func checkLogin(id: String?, pw: String?) -> Bool {
        if id == "roomienotty" && pw == "guhappyshare" {
            return true
        }
        return false
    }
}

