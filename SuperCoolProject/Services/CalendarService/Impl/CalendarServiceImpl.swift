import Combine

class CalendarServiceImpl: CalendarService {
  func listOfSignedInProviders() -> Future<[CalendarProvider], Never> {
    return Future { _ in }
  }

  func listOfSignedInProviders() -> AnyPublisher<[CalendarProvider], Never> {
    return Empty().eraseToAnyPublisher()
  }

  func listOfSupportedProviders() -> Future<[SignInCalendarProvider], Never> {
    return Future { _ in }
  }
}
