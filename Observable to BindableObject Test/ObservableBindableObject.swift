//
//  ObservableBindableObject.swift
//  Observable to BindableObject Test
//
//  Created by Josh Levine on 6/15/19.
//  Copyright © 2019 Josh Levine. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RxSwift

class ObservableBindableObject<Element>: BindableObject {
    let bag = DisposeBag()
    
    let didChange = PassthroughSubject<Element, Never>()
    
    private(set) var value: Element! {
        didSet {
            didChange.send(value)
        }
    }
    
    init(_ observable: Observable<Element>) {
        observable.subscribe(onNext: { [weak self] in self?.value = $0 }).disposed(by: bag)
    }
}

extension Observable {
    func asBindableObject() -> ObservableBindableObject<Element> {
        return ObservableBindableObject(self)
    }
}
