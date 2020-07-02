import Promise

class WeatherServiceImpl: WeatherService {
  func weather(for date: Date) -> Promise<Weather> {
    return Promise { _,_ in }
  }
}
