//
//  ContentView.swift
//  TabBarViewExample
//
//  Created by Mohsin Khawas on 6/11/25.
//

import SwiftUI

let appBackground = Color(red: 230/255, green: 243/255, blue: 255/255)

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            TrendsView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Trends")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .tabViewBottomAccessory { PlaybackAccessoryView() }
    }
}

struct HomeView: View {
    let items = Array(1...25).map { "Music Item \($0)" }
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.blue)
                        Text(item)
                            .font(.headline)
                    }
                    .padding()
                    .background(Color.white.opacity(0.85))
                    .cornerRadius(14)
                    .shadow(radius: 2)
                }
            }
            .padding()
        }
        .background(appBackground.ignoresSafeArea())
        .navigationTitle("Home")
    }
}

struct TrendsView: View {
    let trends = ["SwiftUI 3.0", "AI Integration", "Dark Mode", "iOS 18 Widgets", "Swift Concurrency", "App Clips", "Liquid Glass", "Virtual Backgrounds", "3D Touch", "Multipeer Connectivity", "CoreML", "Swift Package Manager", "AudioKit", "SwiftUI Animations", "SwiftUI Layouts", "SwiftUI Paths", "SwiftUI Text Effects", "SwiftUI Gestures", "SwiftUI Navigation", "SwiftUI Data Loading", "SwiftUI State Management", "SwiftUI Combine", "Xcode"]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                ForEach(trends, id: \.self) { trend in
                    HStack(spacing: 4) {
                        Image(systemName: "flame")
                            .foregroundColor(.orange)
                        Text(trend)
                            .font(.title3)
                            .bold()
                    }
                }
            }
        }
        .background(appBackground)
        .navigationTitle("Trends")
    }
}

struct SettingsView: View {
    @State private var notifications = true
    @State private var darkMode = false
    @State private var location = false
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Toggle(isOn: $notifications) {
                    Label("Enable Notifications", systemImage: "bell")
                }
                .accentColor(Color.blue)

                Toggle(isOn: $darkMode) {
                    Label("Dark Mode", systemImage: "moon")
                }
                .accentColor(Color.blue)

                Toggle(isOn: $location) {
                    Label("Location Access", systemImage: "location")
                }
                .accentColor(Color.blue)

                Divider()

                Button(action: {}) {
                    Label("Account Settings", systemImage: "person")
                        .font(.body)
                }
                .accentColor(Color.blue)

                Button(action: {}) {
                    Label("Help & Support", systemImage: "questionmark.circle")
                        .font(.body)
                }
                .accentColor(Color.blue)
            }
            .padding()
            .font(.body)
        }
        .background(appBackground.ignoresSafeArea())
        .navigationTitle("Settings")
    }
}

struct SearchView: View {
    @State private var query = ""
    let results = ["Swift", "SwiftUI", "UIKit", "Combine", "Xcode", "VisionPro"]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 18) {
                TextField("Search...", text: $query)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.headline)
                    .padding(.vertical)
                ForEach(results.filter { query.isEmpty ? true : $0.localizedCaseInsensitiveContains(query) }, id: \.self) { result in
                    Text(result)
                        .font(.body)
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.85))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .background(appBackground.ignoresSafeArea())
        .navigationTitle("Search")
    }
}

struct PlaybackAccessoryView: View {
    @State private var isPlaying = false
    var body: some View {
        HStack(spacing: 100) {
            Button(action: { /* Previous track action */ }) {
                Image(systemName: "backward.fill")
            }
            .accentColor(Color.blue)
            Button(action: { isPlaying.toggle() }) {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
            }
            .accentColor(Color.blue)
            Button(action: { /* Next track action */ }) {
                Image(systemName: "forward.fill")
            }
            .accentColor(Color.blue)
        }
        .font(.title2)
        .foregroundColor(.primary)
        .shadow(radius: 4, y: 2)
    }
}

#Preview {
    ContentView()
}
