import SwiftUI
import WebKit

struct YTView: View {
    let ID:String
    var body: some View{
        Video(videoID: ID)
            .frame(width: .infinity, height: 190)
            .cornerRadius(15)
            .padding(.horizontal, 24)
    }

}

struct YTView_Previews: PreviewProvider {
    static var previews: some View {
        YTView(ID: "")
    }
}


struct Video: UIViewRepresentable{
    let videoID: String
    
    func makeUIView(context: Context) -> some WKWebView {
        return WKWebView()
    
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let youtubeUrl = URL(string: "https://rutube.ru/video/\(videoID)/") else {
            URL(string: "https://rutube.ru/newpage/")
            return
        }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeUrl))
    }
    
}
