//
//  ViewController.swift
//  WaitingAnimation
//
//  Created by sherry on 16/10/18.
//  Copyright © 2016年 sherry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let waiting = WaitingView()
        waiting.backViewColor = UIColor.blackColor()
        waiting.alpha = 0.6
        waiting.dotColor = UIColor.orangeColor()
        waiting.showInView(self.view)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

