import SwiftUI
import WebKit

struct KakaoPostCodeView: UIViewRepresentable {
    let request: URLRequest
    var webView: WKWebView?
    @Binding var isShowingKakaoWebSheet: Bool
    @Binding var address: String
    
    init(
        request: URLRequest,
        isShowingKakaoWebSheet: Binding<Bool>,
        address: Binding<String>
    ) {
        self.webView = WKWebView()
        self.request = request
        self._isShowingKakaoWebSheet = isShowingKakaoWebSheet
        self._address = address
        self.webView?.configuration.userContentController.add(KakaoWebController(isShowingkakaoWebSheet: _isShowingKakaoWebSheet, address: _address), name: "callBackHandler")
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView!
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        let parent: KakaoPostCodeView
        
        init(parent: KakaoPostCodeView) {
            self.parent = parent
        }
    }
}

class KakaoWebController: NSObject, WKScriptMessageHandler {
    @Binding var isShowingKakaoWebSheet: Bool
    @Binding var address: String
    
    init(
        isShowingkakaoWebSheet: Binding<Bool>,
        address: Binding<String>
    ) {
        self._isShowingKakaoWebSheet = isShowingkakaoWebSheet
        self._address = address
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "callBackHandler", let data = message.body as? [String: Any] {
            if message.name == "callBackHandler" {
                print("message name : \(message.name)")
                print("post Message : \(message.body)")
                
                if let roadAddress = (data["roadAddress"]) as? String {
                    print("roadAddress: \(roadAddress)")
                    address = roadAddress
                    print(address)
                }
                isShowingKakaoWebSheet.toggle()
            }
        }
    }
}


extension KakaoPostCodeView {
    func callJS(_ args: Any = "") {
        webView?.evaluateJavaScript("postMessageToiOS('\(args)')") { result, error in
            if let error {
                print("Error \(error.localizedDescription)")
                return
            }
            
            if result == nil {
                print("It's void function")
                return
            }
            
            print("Received Data \(result ?? "")")
        }
    }
}

