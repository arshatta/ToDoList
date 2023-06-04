//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Аршат Талап on 25.05.2023.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "barlyq örısterdı toltyryñyz"
            
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "jaramdy elektrondyq poştany engızıñız"
            return false
        }
        
        return true
    }
}
