import Foundation
import Promise

public struct Weather {
  public let date: Date
  public let lowTemperature: Float
  public let highTemperature: Float
}

public protocol WeatherService {
  func weather(for date: Date) -> Promise<Weather>
}
