import Foundation
import Combine

class WeatherServiceImpl: WeatherService {
  func weather(for date: Date) -> Future<Weather, WeatherServiceErrors> {
    return Future { _ in }
  }
}
