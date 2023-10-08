import SwiftUI
import WebKit

struct YTView: View {
    let videoURL: URL
    var body: some View{
        WKWebViewWrapper(videoURL: videoURL)
            .frame(width: .infinity, height: 190)
            .cornerRadius(15)
            .padding(.horizontal, 24)
    }

}



//struct Video: UIViewRepresentable{
//    let videoURL: URL
//
//    func makeUIView(context: Context) -> some WKWebView {
//        return WKWebView()
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator(self)
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
////        guard let youtubeUrl = URL(string: "https://rutube.ru/play/embed/\(videoID)/") else {
////                print("Неверный URL-адрес видео")
////                return
////            }
////
////        uiView.scrollView.isScrollEnabled = false
////        uiView.load(URLRequest(url: youtubeUrl))
////        uiView.navigationDelegate = context.coordinator
//        uiView.scrollView.isScrollEnabled = false
//        uiView.load(URLRequest(url: videoURL))
//
//        let request = URLRequest(url: videoURL)
//           uiView.load(request)
//
//           print("Загрузка видео: \(videoURL)")
//    }
//
//    class Coordinator: NSObject, WKNavigationDelegate {
//        var parent: Video
//
//        init(_ parent: Video) {
//            self.parent = parent
//        }
//
//        // Обработка ошибок при загрузке видео
//        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//            print("Ошибка загрузки видео: \(error)")
//        }
//
//        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
//            print("Ошибка загрузки видео: \(error)")
//        }
//    }
//
//}


struct WKWebViewWrapper: UIViewRepresentable {
    let videoURL: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: videoURL)
        uiView.load(request)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WKWebViewWrapper

        init(_ parent: WKWebViewWrapper) {
            self.parent = parent
        }

        // Обработка событий навигации, например, ошибок при загрузке
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            print("Ошибка загрузки: \(error)")
        }
    }
}
