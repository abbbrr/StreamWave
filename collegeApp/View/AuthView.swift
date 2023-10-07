import SwiftUI
import FirebaseAuth

struct AuthView: View {
    @ObservedObject  var viewModel =  AuthViewModel()
    @Binding var isLoggedIn: Bool
    @Binding var email:String
    @Binding var pass:String
    
    @State  var login = true
    @State private var errorText = false
    @State private var textError = ""

    @State private var copyPass = ""

    
    
    
    var body: some View {
        ZStack{
            Color("backgroudColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                Text(login ?  "Создание аккаунта" : "Войти" )
                    .padding()
                    .font(
                        Font.custom("Cera Pro", size: 28)
                        .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding()
                
                
                VStack(alignment: .leading, spacing: 10){
                    Text("Электронная почта")
                      .padding(.horizontal, 30)
                      .font(Font.custom("SF Pro Text", size: 16))
                      .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                    
                    TextField("", text: $viewModel.people.email)
                        .onChange(of: viewModel.people.email, perform: { newEmail in
                            viewModel.people.email = newEmail.lowercased()
                        })
                        .padding()
                        .background(Color("textFieldColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .frame(width: .infinity, height: 50)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    Text("Пароль")
                        .padding(.horizontal, 30)
                      .font(Font.custom("SF Pro Text", size: 16))
                      .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                    
                    SecureField("", text: $viewModel.people.password)
                        .padding()
                        .background(Color("textFieldColor"))
                        .foregroundColor(Color.white)
                        .cornerRadius(10.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 0.5)
                        )
                        .frame(width: .infinity, height: 50)
                        .padding(.horizontal)
                        .padding(.bottom)
                        .padding(.horizontal)
                    
                    if errorText{
                        Text("Ошибка при входе\(textError)")
                            .padding(.horizontal, 25)
                            .foregroundColor(.red)
                    }
                    
                    
                    if login{
                        Text("Подтверди пароль")
                            .padding(.horizontal, 30)
                          .font(Font.custom("SF Pro Text", size: 16))
                          .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                        
                        SecureField("", text: $copyPass)
                            .padding()
                            .background(Color("textFieldColor"))
                            .foregroundColor(Color.white) // цвет текста
                            .cornerRadius(10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 0.5)
                            )
                            .frame(width: .infinity, height: 50)
                            .padding(.horizontal)
                            .padding(.bottom)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading){
                            HStack{
                                Image(viewModel.people.password.count >= 6 ? "okayIcon" : "noIcon")
                                    .frame(width: 20, height: 20)
                                
                                Text("минимум 6 знаков")
                                  .font(Font.custom("SF Pro Text", size: 16))
                                  .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                            }.padding(.horizontal)
                            
                            HStack{
                                Image(viewModel.people.password == copyPass && viewModel.people.password.count == 6 ? "okayIcon" : "noIcon")
                                    .frame(width: 20, height: 20)
                          
                                Text("пароли должны совпадать")
                                    .font(Font.custom("SF Pro Text", size: 16))
                                    .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                            }.padding(.horizontal)
                            
                        }.padding(.horizontal)
                    }
                 
                    
                    VStack(alignment: .center, spacing: 20){
                        Button {
                            if login{
                                viewModel.people.email = ""
                                viewModel.people.password = ""
                                login = false
                            } else{
                                viewModel.people.email = ""
                                viewModel.people.password = ""
                                login = true
                            }
                            } label: {
                                Text(login ?  "Уже есть аккаунт?" : "Еще нет аккаунта?")
                                    .padding(.horizontal)
                                    .font(
                                        Font.custom("PT Root UI", size: 16)
                                        .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                            }
                        
                        Button {
                            if login{
                                if viewModel.people.password == copyPass && viewModel.people.password.count >= 6{
                                    viewModel.register()
                                    viewModel.people.email = ""
                                    viewModel.people.password = ""
                                    self.login.toggle()
                                } else{
                                    print("error либо меньши 6 знаков либо не совподают")
                                }
                                
                            } else {
                                if  viewModel.people.password.count < 6{
                                    errorText = true
                                } else if (viewModel.people.email.isEmpty ){
                                    errorText = true
                                } else{
                                    Auth.auth().signIn(withEmail: viewModel.people.email, password: viewModel.people.password){ (result, error) in
                                        if let error = error {
                                            textError = ": \(error.localizedDescription)"
                                            errorText = true
                                        } else{
                                            errorText = false
                                            isLoggedIn = true
                                            viewModel.login()
                                            email = viewModel.people.email
                                            pass = viewModel.people.password
                                        }
                                    }
                                }
                            }
                        } label: {
                            Text(login ? "Создать аккаунт" : "Войти")
                                .padding()
                                .frame(width: 343, height: 48, alignment: .center)
                                .background(Color(red: 1, green: 0.6, blue: 0.46))
                                .cornerRadius(10)
                                .font(
                                    Font.custom("SF Pro Text", size: 17)
                                    .weight(.semibold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                                .padding(.bottom, 20)
                                .padding(.horizontal, 30)
                        }
                        
                        if let error = viewModel.error {
                            Text(error.localizedDescription)
                                .foregroundColor(.red)
                        }
                    }.padding(.top, 20)
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
                .navigationBarBackButtonHidden(true)
            }
            .padding()
            .padding(.horizontal)
        }
    }
}
