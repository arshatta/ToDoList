//
//  LoginView.swift
//  ToDoList
//
//  Created by Аршат Талап on 25.05.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "tizimder", subtitle: "isterdı oryndañyz", angle: 15, background: .blue)
                
                
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("posta", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("kupiya soz", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "kiru", background: .blue) {
                        viewModel.login()
                    }
                    .padding()

                }
                .offset(y: -50)
                
                // Create Account
                VStack {
                    Text("zhanadan keldinizba?")
                    NavigationLink("akaunty qūru",                 destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
