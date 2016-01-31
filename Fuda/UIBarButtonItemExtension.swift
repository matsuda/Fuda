//
//  UIBarButtonItemExtension.swift
//  Fuda
//
//  Created by Kosuke Matsuda on 2016/01/31.
//  Copyright © 2016年 Kosuke Matsuda. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    private static let badgeTag = 8181

    public convenience init(image: UIImage?, badge: String?, target: AnyObject?, action: Selector) {
        let button = UIButton(type: .Custom, badge: badge)
        button.frame = CGRect(origin: CGPointZero, size: image?.size ?? CGSizeZero)
        button.setImage(image, forState: .Normal)
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        self.init(customView: button)
    }

    public convenience init(title: String?, badge: String?, target: AnyObject?, action: Selector) {
        let button = UIButton(type: .System, badge: badge)
        button.setTitle(title, forState: .Normal)
        button.sizeToFit()
        button.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        self.init(customView: button)
    }

    public var badgeLabel: BadgeLabel? {
        return self.customView?.viewWithTag(self.dynamicType.badgeTag) as? BadgeLabel
    }

    public var badgeText: String? {
        get { return badgeLabel?.text }
        set {
            badgeLabel?.text = newValue
            badgeLabel?.layoutIfNeeded()
        }
    }
}
