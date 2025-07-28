//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Phan on 7/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = "image"
    @State private var imageNumber = 0
    @State private var messageNumber = 0

    let messages: [String] = ["You are great",
                              "You are good!",
                              "You are the best!"]
    
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
            Button("Show Message") {
                imageNumber += 1
                if imageNumber > 9 {
                    imageNumber = 0
                }
                imageName = "image" + "\(imageNumber)"
                print(imageName)
                
                messageNumber += 1
                if messageNumber > messages.count - 1 {
                    messageNumber = 0
                }
                message = messages[messageNumber]
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
