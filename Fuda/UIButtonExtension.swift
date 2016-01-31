//
//  UIButtonExtension.swift
//  Fuda
//
//  Created by Kosuke Matsuda on 2016/01/31.
//  Copyright © 2016年 Kosuke Matsuda. All rights reserved.
//

import UIKit

public extension UIButton {
    private static let badgeTag = 8181

    public convenience init(type: UIButtonType, badge: String?) {
        self.init(type: type)
        setBadgeLabel(badge)
    }

    public var badgeText: String? {
        get { return badgeLabel?.text }
        set {
            if let label = badgeLabel {
                label.text = newValue
            } else {
                setBadgeLabel(badgeText)
                badgeLabel?.text = newValue
                badgeLabel?.layoutIfNeeded()
            }
        }
    }

    public var badgeLabel: BadgeLabel? {
        return self.viewWithTag(self.dynamicType.badgeTag) as? BadgeLabel
    }

    private func setBadgeLabel(badge: String?) {
        let label = BadgeLabel(badge: badge)
        label.tag = self.dynamicType.badgeTag
        self.addSubview(label)

        if let font = self.titleLabel?.font {
            label.font = font
        }

        label.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraint(NSLayoutConstraint(
            item: label, attribute: .Trailing, relatedBy: .Equal,
            toItem: self, attribute: .Trailing, multiplier: 1, constant: 10)
        )
        self.addConstraint(NSLayoutConstraint(
            item: self, attribute: .Top, relatedBy: .Equal,
            toItem: label, attribute: .Top, multiplier: 1, constant: 10))
    }
}
