import SwiftUI

struct HelloView: View {
    @Binding var isLoggedIn: Bool
    @Binding var email:String
    @Binding var pass:String
    
    var body: some View {
            ZStack{
                        Color("backgroudColor")
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(alignment: .center, spacing: 15){
                            Spacer()
                            
                            Image("micro")
                                .resizable()
                                .frame(width: .infinity, height: 300)
                            
                            Text("Добро пожаловать в StreamWave ")
                              .font(
                                Font.custom("Cera Pro", size: 28)
                                  .weight(.bold)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                              .frame(width: 270, alignment: .top)
                          
                            
                            Text("Доступно тысячи подкастов для прослушивания бесплатно.")
                              .font(Font.custom("PT Root UI", size: 16))
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                              .frame(width: 270, alignment: .top)
                            
                            
                            Spacer()
                            
                            //MARK: -auth
                            
                            NavigationLink(destination: AuthView(isLoggedIn:$isLoggedIn, email:$email, pass: $pass, login:true)){
                                Text("Зарегистрироваться")
                                    .frame(width: 343, height: 48, alignment: .center)
                                    .background(Color(red: 1, green: 0.6, blue: 0.46))
                                    .cornerRadius(10)
                                    .font(
                                        Font.custom("SF Pro Text", size: 17)
                                        .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                            }
                            NavigationLink(destination: AuthView(isLoggedIn:$isLoggedIn, email:$email, pass:$pass, login: false)){
                                Text("Войти")
                                    .frame(width: 343, height: 48, alignment: .center)
                                    .background(Color(red: 0.16, green: 0.16, blue: 0.16))
                                    .cornerRadius(10)
                                    .font(
                                        Font.custom("SF Pro Text", size: 17)
                                        .weight(.semibold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(red: 1, green: 0.6, blue: 0.46))
                                                   
                            }
                            
                            Spacer()
                        }
                    }
    }
}
