//
//  NSView+.swift
//  WeatherTest
//
//  Created by Vladimir Nuzhdin on 28.04.2021.
//

import Cocoa

extension NSView {
    func addFilling(_ subview: NSView) {
        
        addSubview(subview)
        
        let attributes: [NSLayoutConstraint.Attribute] = [.left, .trailing, .top, .left]
        subview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(attributes.map({
            NSLayoutConstraint(item: self,
                               attribute: $0,
                               relatedBy: .equal,
                               toItem: subview,
                               attribute: $0,
                               multiplier: 1.0,
                               constant: 0.0)
        }))
    }
}
