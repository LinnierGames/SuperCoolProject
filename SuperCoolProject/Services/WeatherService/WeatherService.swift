import Foundation
import Promise

public struct Weather {
  let date: Date
  let lowTemperature: Float
  let highTemperature: Float
}

public protocol WeatherService {
  func weather(for date: Date) -> Promise<Weather>
}
