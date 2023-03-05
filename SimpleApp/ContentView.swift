//
//  ContentView.swift
//  SimpleApp
//
//  Created by Jose Vazquez on 3/4/23.
//

import SwiftUI

class MyObject: ObservableObject, Identifiable {
    var id = UUID()
    @Published var name: String
    @Published var value: Int
    
    init(name: String, value: Int) {
        self.name = name
        self.value = value
    }
}

struct MyStruct: Identifiable {
    var id = UUID()
    var name: String
    var value: Int
}

class ViewModel: ObservableObject {
    @Published var objects: [MyObject]
    @Published var structs: [MyStruct]
    
    init(objects: [MyObject], structs: [MyStruct]) {
        self.objects = objects
        self.structs = structs
    }
}

struct ContentView: View {
    @StateObject var viewModel = ViewModel(
        objects: [
            MyObject(name: "Michael", value: 23),
            MyObject(name: "Leo", value: 10)],
        structs: [
            MyStruct(name: "Cristiano", value: 7),
            MyStruct(name: "Mario", value: 66)
        ])
    
    var body: some View {
        List {
            Section("Objects") {
                ForEach(viewModel.objects) { o in
                    HStack {
                        Text("\(o.name)")
                        Spacer()
                        Text("\(o.value)")
                    }
                }
            }
            Section("Structs") {
                ForEach(viewModel.structs) { s in
                    HStack {
                        Text("\(s.name)")
                        Spacer()
                        Text("\(s.value)")
                    }
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
