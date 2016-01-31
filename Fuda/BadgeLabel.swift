//
//  BadgeLabel.swift
//  Fuda
//
//  Created by Kosuke Matsuda on 2016/01/31.
//  Copyright © 2016年 Kosuke Matsuda. All rights reserved.
//

import UIKit

public class BadgeLabel: UILabel {

    public var badgeColor: UIColor = UIColor.redColor()
    public let margin: CGFloat = 3

    public override var text: String? {
        didSet {
            guard let text = self.text else {
                hidden = true
                return
            }
            if text.isEmpty {
                hidden = true
                return
            }
            if let count = Int(text) where count == 0 {
                hidden = true
                return
            }
            hidden = false
        }
    }

    public convenience init(badge: String?, color: UIColor = UIColor.redColor()) {
        self.init()
        badgeColor = color
        text = badge
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    public override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, badgeColor.CGColor)
        CGContextFillEllipseInRect(context, rect)
        super.drawRect(rect)
    }

    public override func drawTextInRect(rect: CGRect) {
        let insets = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        let rect = UIEdgeInsetsInsetRect(rect, insets)
        super.drawTextInRect(rect)
    }

    public override func intrinsicContentSize() -> CGSize {
        var size = super.intrinsicContentSize()
        let width = size.width + margin * 2
        let height = size.height + margin * 2
        if width >= height {
            size.width = width
            size.height = width
        } else {
            size.width = height
            size.height = height
        }
        return size
    }

    func initialize() {
        textColor = UIColor.whiteColor()
        backgroundColor = UIColor.clearColor()
        textAlignment = .Center
    }
}
