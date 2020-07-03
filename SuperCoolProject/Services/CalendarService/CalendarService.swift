import Foundation
import Combine

public struct Event {
  public let title: String
  public let location: String
  public let date: Date
}

public protocol CalendarProvider {
  func events(for date: Date) -> AnyPublisher<[Event], Never>
  func signOut() -> Future<Void, Never>
}

public enum SignInCalendarProviderErrors: Error {
  case invalidCredintials
}

public protocol SignInCalendarProvider {
  func signIn(email: String, password: String) -> Future<CalendarProvider, SignInCalendarProviderErrors>
}

public protocol CalendarService {
  func listOfSignedInProviders() -> AnyPublisher<[CalendarProvider], Never>
  func listOfSupportedProviders() -> Future<[SignInCalendarProvider], Never>
}
