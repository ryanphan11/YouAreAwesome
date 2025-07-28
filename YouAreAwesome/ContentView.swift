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

    let messages: [String] = ["You are great",
                              "You are good!",
                              "You are the best!",
                              "You are the best. You should be famous. Let show the world who you are!"]
    
    var body: some View {
        VStack {
            Text(message)
                .font(/*@START_MENU_TOKEN@*/.largeTitle/*@END_MENU_TOKEN@*/)
                .fontWeight(.heavy)
                .foregroundStyle(.orange)
                .multilineTextAlignment(.center)
                .minimumScaleFactor(0.5)
                .frame(height: 130.0)
                .animation(.default, value: message)
                .animation(.easeInOut(duration: 0.15), value: message)
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .shadow(radius: 30.0)
                .animation(.default, value: imageName)

            Spacer()
            Button("Show Message") {
                imageName = "image" + "\(Int.random(in: 0...9))"
                
                message = messages[Int.random(in: 0...messages.count-1)]
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
