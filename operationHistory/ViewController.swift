//
//  ViewController.swift
//  operationHistory
//
//  Created by alexey on 07/12/2019.
//  Copyright © 2019 roshack. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView = WKWebView()

    override func loadView() {
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://100.64.23.57:3000/history")!
        webView.load(URLRequest(url: url))
        webView.scrollView.delegate = self
        webView.allowsBackForwardNavigationGestures = false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
}

