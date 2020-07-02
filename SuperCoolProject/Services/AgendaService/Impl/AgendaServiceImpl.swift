import Promise
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

  func agenda(for date: Date) -> Promise<Agenda> {
    return calendarService.listOfSignedInProviders().then { providers -> Promise<[Event]> in
      let promises = providers.map { provider in
        return provider.events(for: date).recover { error in
          print("failed to get events: \(error)")
          return Promise(value: [])
        }
      }

      return Promises.all(promises).then { allEvents in
        return allEvents.flatMap { $0 }
      }
    }.then { events in
      let agendaItems = events.map { event -> Promise<AgendaItem?> in
        return self.weatherService.weather(for: event.date).then { weather in
          return AgendaItem(event: event, weather: weather)
        }.recover { error in
          print("failed to get weather: \(error)")
          return Promise(value: nil)
        }
      }

      return Promises.all(agendaItems).then { items in
        return Agenda(date: date, items: items.compactMap({ $0 }))
      }
    }
  }
}
