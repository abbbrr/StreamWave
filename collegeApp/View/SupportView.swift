
import SwiftUI

struct SupportView: View {
    var body: some View {
        ZStack(alignment:.leading){
            Color("backgroudColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment:.center){
                VStack{
                    Text("Контакты разработчиков")
                        .foregroundColor(.white)
                        .font(.title2)
                        .bold()
                        
                }.padding(.bottom)
               
                VStack{
                    HStack{
                        VStack(alignment: .leading){
                            Text("Адель Касканова")
                                .foregroundColor(.white)
                                .font(.custom("Helvetica", size: 18))
                                .bold()
                            Text("Designger")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .bold()
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("adel@gmail.com")
                        }
                        
                    }.padding()
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Аблайхан Рауан")
                                .foregroundColor(.white)
                                .font(.custom("Helvetica", size: 18))
                                .bold()
                            Text("FullStack Developer")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .bold()
                        }
                        
                        Spacer()
                        
                        VStack{
                            Text("abr@gmail.com")
                        }
                        
                    }.padding()
                    
                }
                
                Spacer()
            }
            .padding()
            .padding(.vertical)
           
        }.navigationTitle("Поддержка")
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
