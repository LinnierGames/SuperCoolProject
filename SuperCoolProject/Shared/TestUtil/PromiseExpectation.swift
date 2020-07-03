import XCTest
import Promise

public class PromiseExpectation<PromiseValue> {
  let testCase: XCTestCase
  var then: (PromiseValue) -> Void = { _ in XCTFail("unexpected then") }
  var thenExpectation: XCTestExpectation?
  var `catch`: (Error) -> Void = { _ in XCTFail("unexpected catch") }
  var catchExpectation: XCTestExpectation?
  var promise: Promise<PromiseValue>!

  init(_ promise: Promise<PromiseValue>, testCase: XCTestCase) {
    self.testCase = testCase

    promise.then { value in
      self.then(value)

      self.thenExpectation?.fulfill()
      self.catchExpectation?.fulfill()
    }.catch { error in
      self.catch(error)

      self.thenExpectation?.fulfill()
      self.catchExpectation?.fulfill()
    }
  }

  @discardableResult
  public func expectThen(_ then: @escaping (PromiseValue) -> Void) -> XCTestExpectation {
    self.then = then
    self.thenExpectation = testCase.expectation(description: "expect then")
    return self.thenExpectation!
  }

  @discardableResult
  public func expectCatch(_ catch: @escaping (Error) -> Void) -> XCTestExpectation {
    self.catch = `catch`
    self.catchExpectation = testCase.expectation(description: "expect catch")
    return self.catchExpectation!
  }
}

extension XCTestCase {
  public func promiseExpectation<T>(_ promise: Promise<T>) -> PromiseExpectation<T> {
    return PromiseExpectation(promise, testCase: self)
  }
}
