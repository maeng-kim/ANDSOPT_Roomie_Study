//
//  LoginView.swift
//  Roomie_Study
//
//  Created by MaengKim on 12/31/24.
//
import UIKit

import SnapKit
import Then

final class LoginView: UIView {
    
    // MARK: - UIComponent
    
    private let titleLabel = UILabel()
    
    var idTextField = UITextField()
    
    var pwTextField = UITextField()
    
    let loginButton = UIButton()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UISetting
    
    private func setStyle() {
        self.backgroundColor = .white
        
        titleLabel.do {
            $0.text = "Roomie"
            $0.textColor = .mainPurple
            $0.font = .systemFont(ofSize: 20, weight: .heavy)
        }
        
        idTextField.do {
            $0.placeholder = "아이디"
            $0.textColor = .black
            $0.borderStyle = .roundedRect
            $0.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 8
        }
        
        pwTextField.do {
            $0.placeholder = "비밀번호"
            $0.textColor = .black
            $0.borderStyle = .roundedRect
            $0.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 8
        }
        
        loginButton.do {
            $0.setTitle("로그인하기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
            $0.backgroundColor = .gray2
            $0.layer.cornerRadius = 12
            $0.isEnabled = false
        }
    }
    
    private func setUI() {
        self.addSubview(titleLabel)
        self.addSubview(idTextField)
        self.addSubview(pwTextField)
        self.addSubview(loginButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(94)
        }
        
        idTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalTo(335)
        }
        
        pwTextField.snp.makeConstraints{
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(48)
            $0.width.equalTo(335)
        }
        
        loginButton.snp.makeConstraints{
            $0.top.equalTo(pwTextField.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.width.equalTo(335)
        }
    }
}
