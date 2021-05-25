//
//  WebKitViewController.swift
//  AppcentNewsApp
//
//  Created by Hasan Dag on 24.05.2021.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController, WKUIDelegate {
    var weburl : String?
    var webView : WKWebView!
    
    
    
    override func loadView() {
            let webConfiguration = WKWebViewConfiguration()
            webView = WKWebView(frame: .zero, configuration: webConfiguration)
            webView.uiDelegate = self
            view = webView
        }
    override func viewDidLoad() {
            super.viewDidLoad()
            
            let myURL = URL(string:weburl!)
            let myRequest = URLRequest(url: myURL!)
            webView.load(myRequest)
            
        }
    
}
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


