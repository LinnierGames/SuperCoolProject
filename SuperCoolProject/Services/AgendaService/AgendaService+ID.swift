import CalendarService
import WeatherService

public func injectAgendaService() -> AgendaService {
  return AgendaServiceImpl(
    calendarService: injectCalendarService(),
    weatherService: injectWeatherService()
  )
}
