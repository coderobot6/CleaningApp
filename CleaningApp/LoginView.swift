//
//  LoginView.swift
//  CleaningApp
//
//  Created by Triet Tran on 4/8/24.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            Text("Login")
                .font(.title)
                .padding()
            
            TextField("Username", text: $username)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $password)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Text(errorMessage)
                .foregroundColor(.red)
            
            Button(action: {
                // Validate the input fields
                guard !username.isEmpty, !password.isEmpty else {
                    errorMessage = "Please fill in all fields"
                    return
                }
                
                // Perform login action here
                // You can authenticate the user with the provided username and password
                // Example: authenticate(username: username, password: password)
            }) {
                Text("Login")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            }
        }
    }
}


#Preview {
    LoginView()
}
