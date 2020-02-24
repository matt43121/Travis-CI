//
//  AuthView.swift
//  Travis-CI
//
//  Created by Matt Whitaker on 22/02/2020.
//  Copyright © 2020 Matt Whitaker. All rights reserved.
//

import SwiftUI

struct AuthView: View {
    
    @ObservedObject var SettingsVM = Settings()
    @Binding var signInSuccess: Bool
    
    var body: some View {
            VStack {
                Image("travis-ci-logo")
                    .resizable()
                    .frame(width: 400, height: 300)
                Text("https://travis-ci.com/account/preferences")
                TextField("Token", text: $SettingsVM.token)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Login") { self.signInSuccess = true }
            }
    }
}