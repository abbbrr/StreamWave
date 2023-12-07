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
            }
        }
    }
    
    func register(){
        Auth.auth().createUser(withEmail: people.email, password: people.password){ (result, error) in
            if let error = error{
                print("Ошибка при регистрации: \(error.localizedDescription)")
            } else{
                self.isSignedIn = true
            }
        }
    }
    
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            people.email = ""
            isSignedIn = false
        } catch let error {
            print("Ошибка при выходе из системы: \(error.localizedDescription)")
        }
    }
    
}
