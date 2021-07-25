//
//  WeakArray.swift
//  WeatherTest
//
//  Created by Vladimir Nuzhdin on 28.04.2021.
//

import Foundation

class WeakObject<T: AnyObject> {
    
    weak var object: T?
    
    init(object: T) {
        self.object = object
    }
    
}

class WeakArray<T> {
    
    private var array: [WeakObject<AnyObject>] = []
    
    func add(object: T) {
        array.append(WeakObject(object: object as AnyObject))
    }
    
    func remove(object: T) {
        guard let index = array.lastIndex(where: { $0.object === object as AnyObject }) else {
            assert(false)
            return
        }
        
        array.remove(at: index)
    }
    
    func enumerate(_ block: (T)->()) {
        array.forEach {
            if let object = $0.object as? T {
                block(object)
            }
        }
    }
    
}
