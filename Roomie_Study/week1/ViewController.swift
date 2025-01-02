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
    
    private let loginViewModel = LoginViewModel()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = loginView
        
        setActions()
        activateLoginButton()
    }
    
    // MARK: - UISettings
    
    private func setActions() {
        loginView.idTextField.addTarget(self, action: #selector(loginTextDidChange), for: .editingChanged)
        
        loginView.pwTextField.addTarget(self, action: #selector(loginTextDidChange), for: .editingChanged)
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    private func loginAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .cancel))
        self.present(alert, animated: true)
    }
    
    @objc
    private func loginTextDidChange() {
        loginViewModel.isLoginValid(id: loginView.idTextField.text, pw: loginView.pwTextField.text)
    }
    
    @objc
    private func activateLoginButton() {
        loginViewModel.isValid.bind { [weak self] isValid in
            guard let isValid else { return }
            self?.loginView.loginButton.isEnabled = isValid ? true: false
            self?.loginView.loginButton.backgroundColor = isValid ? .mainPurple: .gray2
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        guard let id = loginView.idTextField.text, let pw = loginView.pwTextField.text else {
            return
        }
        
        loginViewModel.isLoginValid(id: id, pw: pw)
        
        if loginViewModel.checkLogin(id: id, pw: pw) {
            loginAlert(title: "로그인 성공!!", message: "welcome to Roomie")
        } else {
            loginAlert(title: "로그인 실패 ㅜ", message: "nagashare")
        }
    }
}
