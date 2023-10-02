////
////  AddReviewView.swift
////  collegeApp
////
////  Created by Рауан Аблайхан on 30.09.2023.
////
//
//import SwiftUI
//
//struct AddReviewView: View {
////    @Binding var review:Reviews
//    
//    @Binding var email:String
//    @State var textReview = ""
//    @State var raiting:Int = 1
//    
//    var body: some View {
//        Form{
//            TextField("", text: $email)
//                .disabled(true)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            TextField("Введите текст для отзыва", text: $textReview)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            
//            Section(header: Text("Выберите рейтинг")) {
//                Picker("Рейтинг", selection: $raiting) {
//                    ForEach(1..<6) { index in
//                        Text("\(index)")
//                    }
//                }
//                .pickerStyle(SegmentedPickerStyle())
//            }
//            HStack{
//                Text("Ваш рейтинг: \(Int(raiting + 1)) ")
//                Image(systemName: "star.fill")
//                    .frame(width: 5, height: 4)
//                    .foregroundColor(.yellow)
//            }
//            .padding()
//            
//            Button {
//                //
//            } label: {
//                Text("Отправить")
//                    .font(
//                        Font.custom("PT Root UI", size: 14)
//                            .weight(.medium)
//                    )
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color(red: 0.16, green: 0.16, blue: 0.16))
//            }
//            .padding(.horizontal, 123)
//            .padding(.vertical, 12)
//            .frame(width: 343, height: 48, alignment: .center)
//            .background(Color(red: 1, green: 0.6, blue: 0.46))
//            .cornerRadius(10)
//            
//        }
//        .padding()
//    }
//}
//
////struct AddReviewView_Previews: PreviewProvider {
////    static var previews: some View {
////        AddReviewView()
////    }
////}
