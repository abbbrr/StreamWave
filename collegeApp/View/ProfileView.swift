import SwiftUI
import Firebase

struct ProfileView: View {
    @Binding var email:String
    @Binding var pass:String
    @Binding var isLoggedIn:Bool
    
    var name:String {
        let components = email.split(separator: "@")
        var name = ""
        
        if let firstComponents = components.first, firstComponents.count >= 2{
            name += String(firstComponents.prefix(2)).uppercased()
        }
       else if let secondComponents = components.last, secondComponents.count >= 2{
           name += String(secondComponents.prefix(2)).lowercased()
        }
        
        return name
    }
    
    var body: some View {
        NavigationView {
            ZStack{
                Color("backgroudColor")
                        .edgesIgnoringSafeArea(.all)

                VStack(alignment: .center, spacing: 40){
                    //MARK: - personInfo
                    VStack(alignment: .center,spacing: 5){
                        ZStack {
                            Circle().frame(width: 50, height: 50)
                            Text(name).foregroundStyle(Color(UIColor.white))
                        }
                        
                        Text("\(email)!")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                            .frame(width: 250)

                    }
                    .padding(.horizontal)
                    
                    //MARK: -table
                    TableList(pass:$pass)
                    
                    
                    //MARK: -exit Button
                    Button {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                            do{
                                try Auth.auth().signOut()
                                self.isLoggedIn = false
                            } catch let error{
                                print("Ошибка при выходе из аккаунта: \(error.localizedDescription)")
                            }
                        }
                    } label: {
                        Text("Выйти")
                            .foregroundColor(.red)
                            .frame(width: 343, height: 48, alignment: .center)
                            .background(Color("textFieldcolor"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .inset(by: 0.5)
                                .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                            )
                    }
                    Spacer()
                }
            }
        }
       
    }
}
