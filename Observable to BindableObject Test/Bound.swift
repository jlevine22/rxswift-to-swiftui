//
//  Bound.swift
//  Observable to BindableObject Test
//
//  Created by Josh Levine on 6/15/19.
//  Copyright © 2019 Josh Levine. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RxSwift

class Bound<Value>: BindableObject {
    let bag = DisposeBag()

    var value: Value {
        didSet {
            didChange.send(value)
        }
    }
    
    let didChange = PassthroughSubject<Value, Never>()
    
    init(_ value: Value) { self.value = value }
}

extension Observable {
    func asBindableObject(initialValue: Element) -> Bound<Element> {
        let bound = Bound(initialValue)
        subscribe(onNext: { [weak bound] in bound?.value = $0 }).disposed(by: bound.bag)
        return bound
    }
}
