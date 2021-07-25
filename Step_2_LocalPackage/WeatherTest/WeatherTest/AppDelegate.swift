//
//  AppDelegate.swift
//  WeatherTest
//
//  Created by Vladimir Nuzhdin on 28.04.2021.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    private let forecastTextual = ForecastTextual(nibName: "ForecastTextual", bundle: nil)
    private let forecastTextual2 = ForecastTextual(nibName: "ForecastTextual", bundle: nil)
    private let forecastTextual3 = ForecastTextual(nibName: "ForecastTextual", bundle: nil)
    @IBOutlet var window: NSWindow!
    @IBOutlet var firstContainer: NSView!
    @IBOutlet var secondContainer: NSView!
    @IBOutlet var thirdContainer: NSView!

    
    var weatherData = WeatherDataImp()
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        firstContainer?.addFilling(forecastTextual.view)
        secondContainer?.addFilling(forecastTextual2.view)
        thirdContainer?.addFilling(forecastTextual3.view)
        
        forecastTextual.weatherData = weatherData
        forecastTextual2.weatherData = weatherData
        forecastTextual3.weatherData = weatherData
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func onSliderValueChanged(_ sender: NSSlider) {
        weatherData.temperature = sender.integerValue
    }
    
}

