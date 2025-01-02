//
//  ObservablePattern.swift
//  Roomie_Study
//
//  Created by MaengKim on 1/2/25.
//
import Foundation

class ObservablePattern<T> {
    private var observer: ((T) -> Void)?
    
    var value: T? {
        didSet { //새로운 값이 저장된 직후 호출
            observer?(value ?? false as! T)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ observer: @escaping (T?) -> Void) {
        self.observer = observer
        observer(value)
    }
}

