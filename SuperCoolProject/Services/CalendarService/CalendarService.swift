import Promise

public struct Event {
  let title: String
  let location: String
  let date: Date
}

public protocol CalendarProvider {
  func events(for date: Date) -> Promise<[Event]>
  func signOut() -> Promise<Void>
}

public enum SignInCalendarProviderErrors: Error {
  case invalidCredintials
}

public protocol SignInCalendarProvider {
  func signIn(email: String, password: String) -> Promise<CalendarProvider>
}

public protocol CalendarService {
  func listOfSignedInProviders() -> Promise<[CalendarProvider]>
  func listOfSupportedProviders() -> Promise<[SignInCalendarProvider]>
}
