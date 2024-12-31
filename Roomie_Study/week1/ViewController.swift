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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    // MARK: - UISetting
    
    private func setUI() {
        self.view.addSubview(loginView)
    }
    
    private func setLayout() {
        loginView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(94)
        }
    }
}

#Preview {
    ViewController()
}
