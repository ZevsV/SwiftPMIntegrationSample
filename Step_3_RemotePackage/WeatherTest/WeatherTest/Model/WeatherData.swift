//
//  WeatherData.swift
//  WeatherTest
//
//  Created by Vladimir Nuzhdin on 28.04.2021.
//

import Foundation
import WeakContainers

protocol WeatherData {
    
    var temperature: Int { get }
    var humidity: Int { get }
    var pressure: Int { get }
    
    func add(listener: WeatherDataListener)
    func remove(listener: WeatherDataListener)

}

protocol WeatherDataListener: AnyObject {
    func onWeatherDataChanged(_ data: WeatherData)
}

class WeatherDataImp: WeatherData {
    
    var temperature: Int = 50 {
        didSet {
            measurementChanged()
        }
    }
    var humidity: Int = 50 {
        didSet {
            measurementChanged()
        }
    }
    var pressure: Int = 50 {
        didSet {
            measurementChanged()
        }
    }
    
    private func measurementChanged() {
        listeners.enumerate {
            $0.onWeatherDataChanged(self)
        }
    }
    
    var listeners = WeakArray<WeatherDataListener>()
    
    func add(listener: WeatherDataListener) {
        listeners.add(object: listener)
    }
    
    func remove(listener: WeatherDataListener) {
        listeners.remove(object: listener)
    }
    
}
