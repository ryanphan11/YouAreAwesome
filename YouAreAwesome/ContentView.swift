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
    let image0 = "image0"
    let image1 = "image1"
    
    var body: some View {
        VStack {
            Spacer()
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .shadow(radius: 30.0)
            Text(message)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .fontWeight(.heavy)
                .foregroundStyle(.orange)
            Spacer()
            Button("Press Me") {
                imageName = imageName == image0 ? image1 : image0
                message = message == youAreAweSomeMessage ? youAreGreatMessage : youAreAweSomeMessage
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
