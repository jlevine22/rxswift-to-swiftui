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

class Bound<Value>: BindableObject {
    var value: Value {
        didSet {
            didChange.send(value)
        }
    }
    
    let didChange = PassthroughSubject<Value, Never>()
    
    init(_ value: Value) { self.value = value }
}
