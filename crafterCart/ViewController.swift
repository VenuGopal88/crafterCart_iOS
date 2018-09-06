//
//  ViewController.swift
//  crafterCart
//
//  Created by Gupta, Venu Gopal on 04/04/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
import WebKit
import Alamofire

class ViewController: UIViewController {

	@IBOutlet weak var webView: WKWebView!
	public let webURL:String? = nil
	let reachabilityManager = NetworkReachabilityManager()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		reachabilityManager?.startListening()
		
		let url = URL (string: "http://store.craftercart.com")
		let request = URLRequest.init(url: url!)
		webView.load(request)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		reachabilityManager?.stopListening()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		reachabilityManager?.listener = { _ in
			if let isNetworkReachable = self.reachabilityManager?.isReachable,
				isNetworkReachable == true {
				//Internet Available
			} else {
				//Internet Not Available"
			}
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

