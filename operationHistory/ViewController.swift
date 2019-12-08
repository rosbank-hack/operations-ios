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

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://100.64.23.57:3000/history")!
        view.addSubview(webView)

        webView.translatesAutoresizingMaskIntoConstraints = false
            let views : [String:Any] = ["webView":webView]
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[webView]-0-|", options: [], metrics: nil, views: views))
            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[webView]-|", options: [], metrics: nil, views: views))

        webView.load(URLRequest(url: url))
        webView.scrollView.delegate = self
        webView.allowsBackForwardNavigationGestures = false

        webView.translatesAutoresizingMaskIntoConstraints = false
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



