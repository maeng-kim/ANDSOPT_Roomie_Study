//
//  TourViewModel.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/3/25.
//
import Foundation

final class TourViewModel { //상태를 관리
    var state = TourObservable<StepTitle>.init(.apply)
}

