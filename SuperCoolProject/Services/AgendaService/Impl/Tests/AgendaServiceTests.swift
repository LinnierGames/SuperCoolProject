//
//  AgendaServiceTests.swift
//  AgendaServiceTests
//
//  Created by Erick Sanchez on 7/2/20.
//  Copyright © 2020 Erick Sanchez. All rights reserved.
//

import XCTest
import CalendarServiceMocks
import WeatherServiceMocks

@testable import AgendaService

class AgendaServiceTests: XCTestCase {
  var calendarServiceMock: CalendarServiceMock!
  var weatherServiceMock: WeatherServiceMock!

  override func setUp() {
    super.setUp()
    calendarServiceMock = CalendarServiceMock(testCase: self)
    weatherServiceMock = WeatherServiceMock(testCase: self)
  }

  func testOne() {
    let service = AgendaServiceImpl(
      calendarService: calendarServiceMock, weatherService: weatherServiceMock)
  }
}
