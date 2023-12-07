import SwiftUI

struct HelloView: View {
    @Binding var isLoggedIn: Bool
    @Binding var email:String
    @Binding var pass:String
    
    @State var checkInternet:Bool
    
    var body: some View {
            ZStack{
                        Color("backgroudColor")
                            .edgesIgnoringSafeArea(.all)
                        
                        VStack(alignment: .center, spacing: 15){
                            Spacer()
                            
                            Image("micro")
                                .resizable()
                                .frame(width: 200, height: 195)
                                .padding()
                                .padding(.bottom)
                            
                            Text("Добро пожаловать в StreamWave")
                              .font(
                                Font.custom("Cera Pro", size: adaptiveTextSize())
                                  .weight(.bold)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                              .frame(maxWidth: .infinity)
                              .padding(.horizontal, 20)
                            
                            
                          
                            if !checkInternet{
                                Text("Доступно тысячи подкастов для прослушивания бесплатно.")
                                  .font(Font.custom("PT Root UI", size: 16))
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                  .frame(width: 270, alignment: .top)
                            }
                            
                            
                            
                            Spacer()
                            
                            //MARK: -auth
                            if !checkInternet{
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
                            } else{
                                VStack(alignment:.center){
                                                           Text("Ooops!")
                                                               .font(.system(size: 50, weight: .bold, design: .default))
                                                               .foregroundColor(.white.opacity(0.7))
                                                               .padding(.bottom, 1)
                                                           
                                                           Text("Slow or no internet conncetion.")
                                                               .font(.system(size: 20, weight: .bold, design: .default))
                                                               .foregroundColor(.white.opacity(0.7))
                                                           Text("Check your internet settings.")
                                                               .font(.system(size: 18, weight: .bold, design: .default))
                                                               .foregroundColor(.white.opacity(0.7))
                                                       }
                                                       .padding()
                                                       .padding(.bottom,1)
                            }
                            
                            
                            
                            Spacer()
                        }
                    }
        
        
    }
    
    
     func adaptiveTextSize() -> CGFloat {
           let device = UIDevice.current.userInterfaceIdiom
           switch device {
           case .phone:
               return 20
           case .pad:
               return 28
           default:
               return 24
           }
       }
}
