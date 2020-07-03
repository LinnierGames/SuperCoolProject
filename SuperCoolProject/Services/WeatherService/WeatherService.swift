import Combine
import Foundation

public struct Weather {
  public let date: Date
  public let lowTemperature: Float
  public let highTemperature: Float
}

public enum WeatherServiceErrors: Error {
}

public protocol WeatherService {
  func weather(for date: Date) -> Future<Weather, WeatherServiceErrors>
}
