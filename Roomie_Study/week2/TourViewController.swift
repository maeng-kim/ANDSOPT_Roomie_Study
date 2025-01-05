//
//  TourViewController.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/3/25.
//
import UIKit

import SnapKit

final class TourViewController: UIViewController {
    
    // MARK: - UIComponent
    
    private let rootView = TourView()
    
    private let viewModel = TourViewModel()
    
    // MARK: - LifeCycle
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        setActions()
        bindViewModel()
    }
    
    // MARK: - UISettings
    
    private func setActions() {
        rootView.applyButton.addTarget(self, action: #selector(applyTourState), for: .touchUpInside)
        
        rootView.tourButton.addTarget(self, action: #selector(tourState), for: .touchUpInside)
        
        rootView.contractButton.addTarget(self, action: #selector(doneState), for: .touchUpInside)
    }
    
    // MARK: - Functions
    
    private func bindViewModel() {
        viewModel.state.bind { [weak self] state in
            guard let state else {return}
            guard let self else {return}
            
            switch state {
            case .apply:
                self.rootView.titleLabel.text = "진행 상황이 존재하지 않아요.\n투어 신청을 시작해보세요."
                self.rootView.applyButton.backgroundColor = .mainPurple
                self.rootView.tourButton.backgroundColor = .mainPurpleLight
                self.rootView.contractButton.backgroundColor = .mainPurpleLight
                self.rootView.applyButton.isEnabled = true
                self.rootView.tourButton.isEnabled = false
                self.rootView.contractButton.isEnabled = false
            case .tour:
                self.rootView.titleLabel.text = "투어 신청을 완료했어요!\n투어를 시작해보세요."
                self.rootView.applyButton.backgroundColor = .gray2
                self.rootView.tourButton.backgroundColor = .mainPurple
                self.rootView.contractButton.backgroundColor = .mainPurpleLight
                self.rootView.applyButton.isEnabled = false
                self.rootView.tourButton.isEnabled = true
                self.rootView.contractButton.isEnabled = false
            case .contract:
                self.rootView.titleLabel.text = "투어를 완료했어요!\n계약서 작성을 시작해보세요."
                self.rootView.applyButton.backgroundColor = .gray2
                self.rootView.tourButton.backgroundColor = .gray2
                self.rootView.contractButton.backgroundColor = .mainPurple
                self.rootView.applyButton.isEnabled = false
                self.rootView.tourButton.isEnabled = false
                self.rootView.contractButton.isEnabled = true
            case .complete:
                self.rootView.titleLabel.text = "계약서 작성을 완료했어요!\n축하드려요."
                self.rootView.applyButton.backgroundColor = .gray2
                self.rootView.tourButton.backgroundColor = .gray2
                self.rootView.contractButton.backgroundColor = .gray2
                self.rootView.applyButton.isEnabled = false
                self.rootView.tourButton.isEnabled = false
                self.rootView.contractButton.isEnabled = false
            }
        }
    }
    
    @objc
    private func applyTourState() {
        print("ddd")
        viewModel.state.state = .tour
    }
    
    @objc
    private func tourState() {
        viewModel.state.state = .contract
    }
    
    @objc
    private func doneState() {
        viewModel.state.state = .complete
    }
}
