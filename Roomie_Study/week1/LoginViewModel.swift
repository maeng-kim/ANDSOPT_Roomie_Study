//
//  LoginViewModel.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/1/25.
//
import Foundation

final class LoginViewModel {
    var isValid = ObservablePattern<Bool>.init(false)
    //var isValid: ((Bool) -> Void)?
    
    func isLoginValid(id: String?, pw: String?) {
        guard let id, let pw else { return }
        
        isValid.value = id.count >= 5 && pw.count >= 8
    }
    
    func checkLogin(id: String?, pw: String?) -> Bool {
        return id == "roomienotty" && pw == "guhappyshare"
    }
}

