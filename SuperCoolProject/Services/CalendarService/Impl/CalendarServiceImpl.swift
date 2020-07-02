import Promise

class CalendarServiceImpl: CalendarService {
  func listOfSignedInProviders() -> Promise<[CalendarProvider]> {
    return Promise { _,_ in }
  }

  func listOfSupportedProviders() -> Promise<[SignInCalendarProvider]> {
    return Promise { _,_ in }
  }
}
