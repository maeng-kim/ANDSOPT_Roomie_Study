//
//  CountViewController.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/9/25.
//

import UIKit
import Combine

import CombineCocoa

final class CountViewController: UIViewController {
    
    private let rootView = CountView()
    
    private let viewModel = CountViewModel()
    
    private let countSubject = CurrentValueSubject<Int, Never>(0)
    
    private var cancelBag = Set<AnyCancellable>()
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
        setActions()
    }
    
    private func bind() {
        viewModel.isValid = { [weak self] isValid in
            guard let self = self else { return }
            if !isValid {
                rootView.descentButton.isEnabled = false
                print("Nope")
            }
        }
    }
    
    private func setActions() {
        rootView.ascentButton
            .tapPublisher
            .sink{ [weak self] _ in
                guard let self = self else { return }
                let value = self.countSubject.value+1
                self.countSubject.send(value)
//                self?.countSubject.send(self?.countSubject.value ?? 0 + 1)
            }
            .store(in: &cancelBag)
        
        rootView.descentButton
            .tapPublisher
            .sink{ [weak self] _ in
                guard let self = self else { return }
                let value = self.countSubject.value - 1
                if self.viewModel.isNumberValid(num: value) {
                    self.countSubject.send(value)
                }
            }
            .store(in: &cancelBag)
        
        countSubject
            .map { "\($0)" }
            .sink { [weak self] num in
                self?.rootView.countLabel.text = num
            }
            .store(in: &cancelBag)
        
        countSubject
            .map{ "\($0 * 2)" }
            .sink {[weak self] doubleNum in
                self?.rootView.doubleCountLabel.text = doubleNum
            }
            .store(in: &cancelBag)
    }
}
