//
//  CountView.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/9/25.
//
import UIKit

import SnapKit
import Then

final class CountView: UIView {
    
    let countLabel = UILabel()
    
    let doubleCountLabel = UILabel()
    
    let descentButton = UIButton()
    
    let ascentButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        self.backgroundColor = .white
        
        countLabel.do {
            $0.font = .systemFont(ofSize: 64, weight: .semibold)
            $0.textColor = .black
        }
        
        doubleCountLabel.do {
            $0.text = ""
            $0.font = .systemFont(ofSize: 64, weight: .semibold)
            $0.textColor = .mainPurpleLight
        }
        
        descentButton.do {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = .mainPurple
            $0.setTitle("누르면 줄어듬", for: .normal)
            $0.isEnabled = true
        }
        
        ascentButton.do {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = .mainPurple
            $0.setTitle("누르면 늘어남", for: .normal)
            $0.isEnabled = true
        }
    }
    
    private func setUI() {
        self.addSubview(countLabel)
        self.addSubview(doubleCountLabel)
        self.addSubview(descentButton)
        self.addSubview(ascentButton)
    }
    
    private func setLayout() {
        countLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(218)
            $0.centerX.equalToSuperview()
        }
        
        doubleCountLabel.snp.makeConstraints{
            $0.top.equalTo(countLabel.snp.bottom).offset(72)
            $0.centerX.equalToSuperview()
        }
        
        descentButton.snp.makeConstraints{
            $0.bottom.equalTo(ascentButton.snp.top).offset(-12)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(62)
        }
        
        ascentButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(62)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(335)
            $0.height.equalTo(62)
        }
    }
}
