//
//  ViewController.swift
//  Example
//
//  Created by Kosuke Matsuda on 2016/01/31.
//  Copyright © 2016年 Kosuke Matsuda. All rights reserved.
//

import UIKit
import Fuda

class ViewController: UIViewController {

    @IBOutlet weak var badgeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let item = UIBarButtonItem(title: "item", badge: "9", target: self, action: "tapBarItem:")
        self.navigationItem.rightBarButtonItem = item

        let button = UIButton(type: .Custom, badge: "8")
        button.setTitle("button", forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.sizeToFit()
        button.frame = {
            var frame = button.frame
            frame.origin = CGPoint(
                x: (self.view.frame.size.width - frame.size.width) / 2,
                y: 200)
            return frame
        }()
        self.view.addSubview(button)

        badgeButton.badgeText = "99"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapBarItem(sender: AnyObject) {
        print(__FUNCTION__)
    }
}

