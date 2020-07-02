//
//  ViewController.swift
//  SuperCoolProject
//
//  Created by Erick Sanchez on 7/1/20.
//  Copyright © 2020 Erick Sanchez. All rights reserved.
//

import UIKit

// display calendar and its weather
// - oAuth
// - cache auth token
// - fetching events from each calendar provider
// - cache events
// - fetch weather
// - cache weather

//use protocols
//use frameworks
//use cocoapods
//add mocking generator

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

import Promise
import CalendarService

// agenda

public struct Agenda {
  let date: Date
  let items: [AgendaItem]
}

public struct AgendaItem {
  let event: Event
  let weather: Weather
}

public protocol AgendaService {
  func agenda(for date: Date) -> Promise<Agenda>
}

// weather

public struct Weather {
  let date: Date
  let lowTemperature: Float
  let highTemperature: Float
}

public protocol WeatherService {
  func weather(for date: Date) -> Promise<Weather>
}

// calendar
