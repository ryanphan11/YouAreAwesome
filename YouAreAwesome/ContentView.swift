//
//  ContentView.swift
//  YouAreAwesome
//
//  Created by Ryan Phan on 7/19/25.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var message = ""
    @State private var imageName = "image"

    let messages: [String] = ["You are great",
                              "You are good!",
                              "You are the best!",
                              "You are the best. You should be famous. Let show the world who you are!"]
    @State var lastImageNumber = -1
    @State var lastMessageNumber = -1
    @State var lastSoundNumber = -1
    @State var audioPlayer: AVAudioPlayer!
    
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
            
            Spacer()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 30.0))
                .shadow(radius: 30.0)
                .animation(.default, value: imageName)

            Spacer()

            Button("Show Message") {
                var currentImageNumber: Int
                repeat {
                    currentImageNumber = Int.random(in: 0...9)
                } while lastImageNumber == currentImageNumber
                lastImageNumber = currentImageNumber
                imageName = "image" + "\(currentImageNumber)"
                
                var currentMessageNumber: Int
                repeat {
                    currentMessageNumber = Int.random(in: 0...messages.count-1)
                } while lastMessageNumber == currentMessageNumber
                lastMessageNumber = currentMessageNumber
                message = messages[currentMessageNumber]
                
                var currentSoundNumber: Int
                repeat {
                    currentSoundNumber = Int.random(in: 0...5)
                } while lastSoundNumber == currentSoundNumber
                lastSoundNumber = currentSoundNumber
                
                let soundName = "sound\(currentSoundNumber)"
                guard let soundFile = NSDataAsset(name: soundName) else {
                    print("😡 Error could not read file named \(soundName).")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("😡 Error: \(error.localizedDescription) creating audio player.")
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
