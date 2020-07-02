//
//  AgendaService.swift
//  SuperCoolProject
//
//  Created by Erick Sanchez on 7/2/20.
//  Copyright © 2020 Erick Sanchez. All rights reserved.
//

import Promise
import CalendarService
import WeatherService

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
