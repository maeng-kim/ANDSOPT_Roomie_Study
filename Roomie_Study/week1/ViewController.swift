//
//  ViewController.swift
//  Roomie_Study
//
//  Created by MaengKim on 12/31/24.
//

import UIKit

import SnapKit

class ViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let loginView = LoginView()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = loginView
        
        setActions()
    }
    
    // MARK: - UISettings
    
    private func setActions() {
        loginView.idTextField.addTarget(self, action: #selector(activateLoginButton), for: .editingChanged)
        
        loginView.pwTextField.addTarget(self, action: #selector(activateLoginButton), for: .editingChanged)
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    private func loginAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @objc private func activateLoginButton() {
        
        let isIDValid = (loginView.idTextField.text?.count ?? 0) >= 5
        let isPWValid = (loginView.pwTextField.text?.count ?? 0) >= 8
        
        if isIDValid && isPWValid {
            loginView.loginButton.isEnabled = true
            loginView.loginButton.backgroundColor = .mainPurple
        } else {
            loginView.loginButton.isEnabled = false
            loginView.loginButton.backgroundColor = .gray2
        }
    }
    
    @objc private func loginButtonDidTap() {
        guard let id = loginView.idTextField.text, let pw = loginView.pwTextField.text else {
            return
        }
        
        let inputLogin = LoginModel(id: id, pw: pw)
        
        if inputLogin.id == "rommienotty" && inputLogin.pw == "guhappyshare" {
            loginAlert(title: "로그인 성공!!", message: "welcome to Roomie")
        } else {
            loginAlert(title: "로그인 실패 ㅜ", message: "nagashare")
        }
    }
}

#Preview {
    ViewController()
}
