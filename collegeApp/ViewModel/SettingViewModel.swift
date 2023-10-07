import Foundation
import Firebase

class SettingViewModel:ObservableObject{
    func changePassword(newPassword:String, complection: @escaping(Error?) -> Void){
        if let user = Auth.auth().currentUser{
            user.updatePassword(to: newPassword){ error in
                complection(error)
            }
        }
    }
}
