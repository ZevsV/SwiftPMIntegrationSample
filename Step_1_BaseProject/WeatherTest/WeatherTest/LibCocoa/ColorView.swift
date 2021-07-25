//
//  ColorView.swift
//  WeatherTest
//
//  Created by Vladimir Nuzhdin on 28.04.2021.
//

import Cocoa

class ColorView: NSView {
    
    var backgroundColor: NSColor?
    
    override func draw(_ dirtyRect: NSRect) {
        guard let backgroundColor = backgroundColor else {
            return
        }
        backgroundColor.setFill()
        NSBezierPath(rect: dirtyRect).fill()
    }
    
}

class GreenColorView: ColorView {
    override var backgroundColor: NSColor? {
        get {
            .lightGray
        }
        set {
            
        }
    }
}
