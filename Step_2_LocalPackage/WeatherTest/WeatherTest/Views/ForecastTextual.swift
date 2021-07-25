//
//  ForecastTextual.swift
//  WeatherTest
//
//  Created by Vladimir Nuzhdin on 28.04.2021.
//

import Cocoa

class ForecastTextual: NSViewController, WeatherDataListener {
    
    @IBOutlet private var temperatureLabel: NSTextField?
    @IBOutlet private var humidity: NSTextField?
    @IBOutlet private var pressure: NSTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        update()
    }
    
    var weatherData: WeatherData? {
        didSet {
            oldValue?.remove(listener: self)
            update()
            weatherData?.add(listener: self)
        }
    }
    
    func onWeatherDataChanged(_ data: WeatherData) {
        update()
    }
    
    private func update() {
        guard let temperatureLabel = temperatureLabel else { return }
        guard let humidity = humidity else { return }
        guard let pressure = pressure else { return }
        temperatureLabel.stringValue = "Temperature: \(weatherData?.temperature ?? 0)"
        humidity.stringValue = "Humidity: \(weatherData?.humidity ?? 0)"
        pressure.stringValue = "Pressure: \(weatherData?.pressure ?? 0)"
    }
    
}
