//
//  DataStore.swift
//  Observable to BindableObject Test
//
//  Created by Josh Levine on 6/9/19.
//  Copyright © 2019 Josh Levine. All rights reserved.
//

import Foundation
import RxSwift
import SwiftUI
import Combine

public class DataStore {
    public let someInt: Observable<Int>

    private let _someInt = BehaviorSubject<Int>(value: 0)
    
    init() {
        someInt = _someInt.asObservable()
    }

    public func increment() {
        let current = try! _someInt.value()
        _someInt.onNext(current + 1)
    }
    
    public func decrement() {
        let current = try! _someInt.value()
        _someInt.onNext(max(current - 1, 0))
    }
}
