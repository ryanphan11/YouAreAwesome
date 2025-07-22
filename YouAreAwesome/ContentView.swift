//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Phan on 7/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = ""
    let youAreAweSomeMessage = "You are Awesome!"
    let youAreGreatMessage = "You are Great!"
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            Text(message)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
            Spacer()
            Button("Press Me") {
                if imageName == "hand.thumbsup" {
                    imageName = "sun.max.fill"
                    message = youAreAweSomeMessage
                } else {
                    imageName = "hand.thumbsup"
                    message = youAreGreatMessage
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.orange)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
