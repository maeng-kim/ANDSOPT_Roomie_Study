//
//  ObservablePattern.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/4/25.
//
import Foundation

class TourObservable<T> {
    private var observer: ((T) -> Void)?
    
    var state: T? {
        didSet {
            observer?(state ?? false as! T)
        }
    }
    
    init(_ state: T?) {
        self.state = state
    }
    
    func bind(_ observer: @escaping (T?) -> Void) {
        self.observer = observer
        observer(state)
    }
}
