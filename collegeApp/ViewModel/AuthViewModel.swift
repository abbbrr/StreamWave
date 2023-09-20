//
//  AuthViewModel.swift
//  collegeApp
//
//  Created by Рауан Аблайхан on 11.09.2023.
//

import Foundation
import FirebaseAuth

class AuthViewModel: ObservableObject{
    @Published var people = People(email: "", password: "")
    @Published var isSignedIn = false
    @Published var error: Error?
    
    func login(){
        Auth.auth().signIn(withEmail: people.email, password: people.password ){ (result, error) in
            if let error = error{
                print("Ошибка при входе: \(error.localizedDescription)")
            } else{
                self.isSignedIn = true
                print("Успешный вход")
            }
        }
        
      
    }
    
    func register(){
        Auth.auth().createUser(withEmail: people.email, password: people.password){ (result, error) in
            if let error = error{
                print("Ошибка при регистрации: \(error.localizedDescription)")
            } else{
                self.isSignedIn = true
                print("Успешная регистрация ")
            }
        }
    }
    
    
}
