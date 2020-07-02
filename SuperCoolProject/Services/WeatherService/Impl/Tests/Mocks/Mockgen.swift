import XCTest
import Promise
import WeatherService

// sourcery:inline:WeatherService.Mockgen
// MARK: - WeatherService
open class WeatherServiceMock: WeatherService {

  private let testCase: XCTestCase

  public init(testCase: XCTestCase) {
    self.testCase = testCase
  }

  // MARK: weather(for date: Date)

  private var expectationForWeatherForDate: XCTestExpectation?
  private var expectWeatherForDateBlock: (Date) throws -> Promise<Weather> = { _  in
    XCTFail("unexpected call to WeatherService.weather(for:)")
    fatalError()
  }

  @discardableResult
  open func expectWeatherForDate(_ block: @escaping (Date) throws -> Promise<Weather>) -> XCTestExpectation {
    self.expectationForWeatherForDate = self.testCase.expectation(description: "WeatherService.weather(for:)")
    self.expectWeatherForDateBlock = block
    return self.expectationForWeatherForDate!
  }

  open func weather(for date: Date) -> Promise<Weather> {
    XCTAssertNotNil(self.expectationForWeatherForDate)
    self.expectationForWeatherForDate?.fulfill()
    do {
      return try self.expectWeatherForDateBlock(date)
    } catch {
      XCTFail("unexpecting thrown error: \(error.localizedDescription)")
      fatalError()
    }
  }
}
// sourcery:end
