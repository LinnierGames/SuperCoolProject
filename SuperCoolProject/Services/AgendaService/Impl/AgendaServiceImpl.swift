import Foundation
import Combine
import CalendarService
import WeatherService

class AgendaServiceImpl: AgendaService {
  private let calendarService: CalendarService
  private let weatherService: WeatherService

  init(
    calendarService: CalendarService,
    weatherService: WeatherService
  ) {
    self.calendarService = calendarService
    self.weatherService = weatherService
  }

  func agenda(for date: Date) -> AnyPublisher<Agenda, Never> {
    return calendarService.listOfSignedInProviders()
      .flatMap { providers in
        Publishers.Sequence(
          sequence: providers.map { $0.events(for: date) }
        ).flatMap { $0 }.collect()
      }
      .map { nestedEvents in
        nestedEvents.flatMap { $0 }
      }
      .flatMap { events in
        Publishers.Sequence(sequence: events.map { event in
          self.weatherService.weather(for: event.date).map { weather in
            AgendaItem(event: event, weather: weather)
          }.catch { _ in Empty() }
        }).flatMap { $0 }.collect()
      }
      .map { items in
        Agenda(date: date, items: items)
      }.eraseToAnyPublisher()
  }
}
