//
//  TourView.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/3/25.
//
import UIKit

import SnapKit
import Then

final class TourView: UIView {
    
    // MARKL - UIComponent
    
    let titleLabel = UILabel()
    
    let applyButton = UIButton()
    
    let tourButton = UIButton()
    
    let contractButton = UIButton()
    
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
            $0.textColor = .black
            $0.text = ""
            $0.numberOfLines = 2
            $0.font = .systemFont(ofSize: 20, weight: .medium)
        }
        
        applyButton.do {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = .mainPurple
            $0.setTitle("투어 신청", for: .normal)
            $0.isEnabled = false
        }
        
        tourButton.do {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = .mainPurpleLight
            $0.setTitle("투어", for: .normal)
            $0.isEnabled = false
        }
        
        contractButton.do {
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
            $0.layer.cornerRadius = 12
            $0.backgroundColor = .mainPurpleLight
            $0.setTitle("계약서 작성", for: .normal)
            $0.isEnabled = false
        }
    }
    
    private func setUI() {
        self.addSubview(titleLabel)
        self.addSubview(applyButton)
        self.addSubview(tourButton)
        self.addSubview(contractButton)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().inset(92)
        }
        
        applyButton.snp.makeConstraints{
            $0.bottom.equalTo(tourButton.snp.top).offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        tourButton.snp.makeConstraints{
            $0.bottom.equalTo(contractButton.snp.top).offset(-16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        contractButton.snp.makeConstraints{
            $0.bottom.equalToSuperview().inset(64)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
    }
}
