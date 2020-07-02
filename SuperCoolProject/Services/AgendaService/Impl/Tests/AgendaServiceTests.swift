//
//  AgendaServiceTests.swift
//  AgendaServiceTests
//
//  Created by Erick Sanchez on 7/2/20.
//  Copyright © 2020 Erick Sanchez. All rights reserved.
//

import XCTest
@testable import CalendarService
import CalendarServiceMocks
@testable import WeatherService
import WeatherServiceMocks
import Promise

@testable import AgendaService

class AgendaServiceTests: XCTestCase {
  let oneHour: TimeInterval = 60 * 60
  let fiveHours: TimeInterval = 60 * 60 * 5

  var calendarServiceMock: CalendarServiceMock!
  var weatherServiceMock: WeatherServiceMock!

  override func setUp() {
    super.setUp()
    calendarServiceMock = CalendarServiceMock(testCase: self)
    weatherServiceMock = WeatherServiceMock(testCase: self)
  }

  func testOne() {
    let today = Date()
    let event1 = Event(title: "Work", location: "San Francisco, CA", date: today.advanced(by: oneHour))
    let event2 = Event(title: "Home", location: "Santa Rosa, CA", date: today.advanced(by: fiveHours))

    let googleCalendarProviderMock = CalendarProviderMock(testCase: self)
    googleCalendarProviderMock.expectEventsForDate { date in
      XCTAssertEqual(date, today)
      return Promise(value: [event1, event2])
    }
    calendarServiceMock.expectListOfSignedInProviders {
      return Promise(value: [googleCalendarProviderMock])
    }

    var expectingDates = [event1, event2].map { $0.date }
    var resultingWeather = [
      Weather(date: event1.date, lowTemperature: 72, highTemperature: 82),
      Weather(date: event1.date, lowTemperature: 54, highTemperature: 64),
    ]
    weatherServiceMock.expectWeatherForDate { date in
      let expectingDate = expectingDates.removeFirst()
      XCTAssertEqual(date, expectingDate)
      let resultingWeather = resultingWeather.removeFirst()
      return Promise(value: resultingWeather)
    }.expectedFulfillmentCount = 2
    
    let service = AgendaServiceImpl(
      calendarService: calendarServiceMock, weatherService: weatherServiceMock)

    let agenda = service.agenda(for: today)

    // todo test the agenda promise succeeds and has the expected AgendaItem properties

    waitForExpectations(timeout: 5.0)
  }
}
