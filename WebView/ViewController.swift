//
//  ViewController.swift
//  WebView
//
//  Created by jungbyungwoo1 on 2016. 11. 8..
//  Copyright © 2016년 jungbyungwoo1. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var url: UITextField!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    func load(url: String) {
        let request = NSURLRequest(URL: NSURL(string: url)!)
        webView.loadRequest(request)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        webView.delegate = self
        load("http://www.naver.com")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        loadingIndicator.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingIndicator.stopAnimating()
    }
    
    func validate(url: String) -> String {
        let protokol = "http://"
        if (!url.hasPrefix(protokol)) {
            return protokol + url
        } else {
            return url
        }
    }

    @IBAction func onGoBtn(sender: AnyObject) {
        load(validate(url.text!))
    }
    
    @IBAction func onSite1Btn(sender: AnyObject) {
        load("http://www.daum.net")
    }
    @IBAction func onSite2Btn(sender: AnyObject) {
        load("http://www.google.com")
    }
    @IBAction func onHtmlBtn(sender: AnyObject) {
        let html = "<h1>fuck you</h1><ul><li>fuck</li><li>you</li></ul>"
        webView.loadHTMLString(html, baseURL: nil)
    }
    @IBAction func onFileBtn(sender: AnyObject) {
        let htmlBundle = NSBundle.mainBundle()
        let filePath = htmlBundle.pathForResource("dummy", ofType: "html")
        load(filePath!)
    }

    @IBAction func onStopBtn(sender: AnyObject) {
        webView.stopLoading()
    }
    @IBAction func onRefreshBtn(sender: AnyObject) {
        webView.reload()
    }
    @IBAction func onPrevBtn(sender: AnyObject) {
        webView.goBack()
    }
    @IBAction func onNextBtn(sender: AnyObject) {
        webView.goForward()
    }
}

