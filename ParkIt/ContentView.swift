//
//  ContentView.swift
//  ParkIt
//
//  Created by Connor Smith on 8/17/25.
//

// TODO:
// add confirmation button

import SwiftUI

struct ContentView: View {
    @State private var parkingFloor: String = ""
    
       private static let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "EEEE, MMMM d, yyyy"
           return formatter
       }()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "car")
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .foregroundStyle(.tint)
                Image(systemName: "mappin.and.ellipse") // Pin icon
                    .imageScale(.large)
                    .font(.largeTitle)
                    .foregroundColor(.accentColor)
                    .foregroundStyle(.tint)
            }
            Text("\(Self.dateFormatter.string(from: Date()))")
                .font(.headline)
                .padding()
            if !parkingFloor.isEmpty {
                Text("You parked on floor")
                    .font(.title)
                    .fontWeight(.bold)
                Text(parkingFloor)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
                    .padding(.top, 5)
                Button(action: {
                    parkingFloor = ""
                }) {
                    Text("Thanks I've returned to my car")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.top, 20)
            } else {
                TextField(
                    "Hi there, what floor did you park on today?",
                    text: $parkingFloor
                )
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .frame(maxWidth: 300)
                .padding(.horizontal)
                .keyboardType(.numberPad)
            }

            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
