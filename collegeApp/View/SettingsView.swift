import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingViewModel()
    @State private var isShowPass = false
    @State private var isShowCopyPass = false
    @State private var oldPass = ""
    @State private var newPass = ""
    @State private var copyNewPass = ""
    @State private var text = " "
    
    @Binding var pass:String
    
    @State private var isShowingError = false
    
    var body: some View {
        ZStack{
            Color("backgroudColor")
                    .edgesIgnoringSafeArea(.all)
            
            ZStack(alignment: .leading){
                       Color("textFieldcolor")
                               .edgesIgnoringSafeArea(.all)
                           
                           VStack(alignment: .leading){
                               HStack(spacing: 20){
                                   Text("Изменить пароль")
                                     .font(
                                       Font.custom("PT Root UI", size: 16)
                                         .weight(.medium)
                                     )
                                     .foregroundColor(Color(red: 0.94, green: 0.91, blue: 0.9))
                                   
                               }
                               .padding(10)
                               .onTapGesture {
                                   self.isShowPass.toggle()
                               }
                               .sheet(isPresented: $isShowPass) {
                                   VStack(spacing: 20){
                                       SecureField("Введите старый пароль", text: $oldPass)
                                           .textFieldStyle(RoundedBorderTextFieldStyle())
                                       if isShowingError{
                                           Text(text)
                                               .foregroundColor(.red)
                                               .padding(.horizontal)
                                       }
                                      
                                       
                                       SecureField("Введите новый пароль", text: $newPass)
                                           .textFieldStyle(RoundedBorderTextFieldStyle())
                                       
                                       SecureField("Повторите пароль", text: $copyNewPass)
                                           .textFieldStyle(RoundedBorderTextFieldStyle())
                                       if isShowCopyPass{
                                           Text("\(text)")
                                               .foregroundColor(.red)
                                               .padding(.horizontal)
                                       }
                                                                    
                                       Button {
                                           if pass != oldPass {
                                               text = "Неправильный текущий пароль"
                                               self.isShowingError = true
                                           } else {
                                               self.isShowingError = false
                                               
                                               if newPass != copyNewPass{
                                                   text = "Пароли должны совпадать!"
                                                   self.isShowCopyPass = true
                                               } else if newPass.count < 6 {
                                                   text = "Пароль должен составлять из 6 символов!"
                                                   self.isShowCopyPass = true
                                               }else {
                                                   self.isShowCopyPass = false
                                                   
                                                   viewModel.changePassword(newPassword: newPass) { error in
                                                       if let error = error{
                                                           print("Ошибка при изменении пароля: \(error.localizedDescription)")
                                                       } else {
                                                           oldPass = ""
                                                           newPass = ""
                                                           copyNewPass = ""
                                                           self.isShowPass = false
                                                       }
                                                   }
                                               }
                                           }
                                           
                                          
                                       } label: {
                                           Text("Изменить")
                                               .font(
                                                    Font.custom("PT Root UI", size: 16)
                                               .weight(.medium)
                                               )
                                               .multilineTextAlignment(.center)
                                               .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
                                       }
                                        .padding(.horizontal, 123)
//                                        .padding(.vertical, 12)
                                        .frame(width: 343, height: 48, alignment: .center)
                                        .background(Color(red: 1, green: 0.6, blue: 0.46))
                                        .cornerRadius(10)
                                        

                                   }.padding()
                               }
                       }
                   }
                   .frame(width: .infinity, height: 80)
                   .overlay(
                       RoundedRectangle(cornerRadius: 15)
                       .inset(by: 0.5)
                       .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 1)
                       )
                   .cornerRadius(15)
                   .padding(.horizontal)
                   .padding(.bottom)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(pass: .constant("asdad"))
    }
}
