//
//  ContentView.swift
//  Travis-CI
//
//  Created by Matt Whitaker on 26/01/2020.
//  Copyright © 2020 Matt Whitaker. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "tray.full.fill")
                    Text("Repos")
                }.tag(0)
            Text("Second View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }.tag(1)
            Text("Profile View")
            .tabItem {
                Image(systemName: "person")
                Text("Profile")
            }.tag(2)
        }
    }
}

struct Build {
    var id: Int
    var number: String
    var state: String
}

struct Branch: Identifiable {
    var id = UUID()
    var name: String
    var last_build: Build
}

struct Repository: Identifiable {
    var id = UUID()
    var name: String
    var slug: String
    var url: String
    var favourite: Bool
    var default_branch: Branch
    var passing: Bool
    var buildNo: Int
    var duration: Int
    var Finished: Int
}

struct HomeView: View {
    
    let repos = [
        Repository(name: "repo1", slug: "matt43121/repo1", url: "https://example.com", favourite: true, default_branch: Branch(name: "Master"), passing: true, buildNo: 1234, duration: 500, Finished: 1920),
        Repository(name: "repo2", slug: "matt43121/repo2", url: "https://example2.com", favourite: true, default_branch: Branch(name: "Master"), passing: false, buildNo: 5678, duration: 600, Finished: 1920),
        Repository(name: "repo3", slug: "matt43121/repo3", url: "https://example3.com", favourite: false, default_branch: Branch(name: "Master"), passing: true, buildNo: 9101112, duration: 1200, Finished: 1920),
    ]
    var body: some View {
            NavigationView {
                List {
                    ForEach(repos) { repo in
                        NavigationLink(destination: RepoBuildDetailView(repo: repo)
                                .navigationBarTitle(Text(repo.name))) {
                        RepoBuildView(repo: repo)
                           .contextMenu {
                               Button(action: {
                                   // change country setting
                               }) {
                                Text("Repo URL")
                                Image(systemName: "globe")
                               }

                               Button(action: {
                                   // enable geolocation
                               }) {
                                   Text("Detect Location")
                                   Image(systemName: "location.circle")
                               }
                           }
                        }
                    }
                }
            .navigationBarTitle(Text("Repositories"))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
            .environment(\.colorScheme, .dark)
        }
    }
}
