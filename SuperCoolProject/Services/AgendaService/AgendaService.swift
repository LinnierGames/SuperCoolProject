import Foundation
import Combine
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
  func agenda(for date: Date) -> AnyPublisher<Agenda, Never>
}
