//
//  ContentView.swift
//  Observable to BindableObject Test
//
//  Created by Josh Levine on 6/9/19.
//  Copyright © 2019 Josh Levine. All rights reserved.
//

import SwiftUI
import RxSwift

struct ContentView : View {
    @ObjectBinding var someInt: Bound<Int>
    @EnvironmentObject var dataStore: Bound<DataStore>
    var body: some View {
        VStack {
            Text("Hello World \(someInt.value)")
            Button(action: {
                self.dataStore.value.increment()
            }) {
                Text("Increment")
            }
            Button(action: {
                self.dataStore.value.decrement()
            }) {
                Text("Decrement")
            }
        }
        
    }
}

#if DEBUG
public let dataStore = DataStore()

struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(someInt: dataStore.someInt.asBindableObject(initialValue: 0))
            .environmentObject(Bound(dataStore))
    }
}
#endif
