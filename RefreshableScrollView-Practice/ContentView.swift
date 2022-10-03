//
//  ContentView.swift
//  RefreshableScrollView-Practice
//
//  Created by Berkay Disli on 3.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var maxNumber = 2
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 16) {
                    ForEach(1...maxNumber, id:\.self) { item in
                        Text("Item: **\(item)**")
                            .font(.title3)
                    }
                }
                .padding(.vertical)
            }
            .padding(.horizontal)
            .refreshable {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.easeInOut) {
                        maxNumber += 2
                    }
                }
            }
            .navigationTitle("Refreshable")
            .preferredColorScheme(.dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
