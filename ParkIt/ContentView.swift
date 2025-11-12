//
//  ContentView.swift
//  ParkIt
//
//  Created by Connor Smith on 8/17/25.
//

import SwiftUI

struct ContentView: View {
    @State private var parkingFloor: String = ""
    @State private var showClearConfirmation: Bool = false
    
       private static let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "EEEE, MMMM d, yyyy"
           return formatter
       }()
    
    var body: some View {
        VStack {
            Text("ParkIt")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
                .padding(.top, 20)
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
                    showClearConfirmation = true
                }) {
                    Text("Thanks I've returned to my car")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                .padding(.top, 20)
                .alert("Are you sure?", isPresented: $showClearConfirmation) {
                    Button("No, I want to keep my floor saved", role: .cancel) { }
                    Button("Yes, I've returned to my car", role: .destructive) {
                        parkingFloor = ""
                    }
                } message: {
                    Text("This will clear your saved parking floor.")
                }
            } else {
                TextField(
                    "What floor did you park on today?",
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
