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
    return Promise { _,_ in }
  }
}
