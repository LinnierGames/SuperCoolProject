import XCTest
import Promise
import CalendarService

// sourcery:inline:CalendarProvider.Mockgen
// MARK: - CalendarProvider
open class CalendarProviderMock: CalendarProvider {

  private let testCase: XCTestCase

  public init(testCase: XCTestCase) {
    self.testCase = testCase
  }

  // MARK: events(for date: Date)

  private var expectationForEventsForDate: XCTestExpectation?
  private var expectEventsForDateBlock: (Date) throws -> Promise<[Event]> = { _  in
    XCTFail("unexpected call to CalendarProvider.events(for:)")
    fatalError()
  }

  @discardableResult
  open func expectEventsForDate(_ block: @escaping (Date) throws -> Promise<[Event]>) -> XCTestExpectation {
    self.expectationForEventsForDate = self.testCase.expectation(description: "CalendarProvider.events(for:)")
    self.expectEventsForDateBlock = block
    return self.expectationForEventsForDate!
  }

  open func events(for date: Date) -> Promise<[Event]> {
    XCTAssertNotNil(self.expectationForEventsForDate)
    self.expectationForEventsForDate?.fulfill()
    do {
      return try self.expectEventsForDateBlock(date)
    } catch {
      XCTFail("unexpecting thrown error: \(error.localizedDescription)")
      fatalError()
    }
  }
  // MARK: signOut()

  private var expectationForSignOut: XCTestExpectation?
  private var expectSignOutBlock: () throws -> Promise<Void> = {  
    XCTFail("unexpected call to CalendarProvider.signOut")
    fatalError()
  }

  @discardableResult
  open func expectSignOut(_ block: @escaping () throws -> Promise<Void>) -> XCTestExpectation {
    self.expectationForSignOut = self.testCase.expectation(description: "CalendarProvider.signOut")
    self.expectSignOutBlock = block
    return self.expectationForSignOut!
  }

  open func signOut() -> Promise<Void> {
    XCTAssertNotNil(self.expectationForSignOut)
    self.expectationForSignOut?.fulfill()
    do {
      return try self.expectSignOutBlock()
    } catch {
      XCTFail("unexpecting thrown error: \(error.localizedDescription)")
      fatalError()
    }
  }
}
// sourcery:end
// sourcery:inline:CalendarService.Mockgen
// MARK: - CalendarService
open class CalendarServiceMock: CalendarService {

  private let testCase: XCTestCase

  public init(testCase: XCTestCase) {
    self.testCase = testCase
  }

  // MARK: listOfSignedInProviders()

  private var expectationForListOfSignedInProviders: XCTestExpectation?
  private var expectListOfSignedInProvidersBlock: () throws -> Promise<[CalendarProvider]> = {  
    XCTFail("unexpected call to CalendarService.listOfSignedInProviders")
    fatalError()
  }

  @discardableResult
  open func expectListOfSignedInProviders(_ block: @escaping () throws -> Promise<[CalendarProvider]>) -> XCTestExpectation {
    self.expectationForListOfSignedInProviders = self.testCase.expectation(description: "CalendarService.listOfSignedInProviders")
    self.expectListOfSignedInProvidersBlock = block
    return self.expectationForListOfSignedInProviders!
  }

  open func listOfSignedInProviders() -> Promise<[CalendarProvider]> {
    XCTAssertNotNil(self.expectationForListOfSignedInProviders)
    self.expectationForListOfSignedInProviders?.fulfill()
    do {
      return try self.expectListOfSignedInProvidersBlock()
    } catch {
      XCTFail("unexpecting thrown error: \(error.localizedDescription)")
      fatalError()
    }
  }
  // MARK: listOfSupportedProviders()

  private var expectationForListOfSupportedProviders: XCTestExpectation?
  private var expectListOfSupportedProvidersBlock: () throws -> Promise<[SignInCalendarProvider]> = {  
    XCTFail("unexpected call to CalendarService.listOfSupportedProviders")
    fatalError()
  }

  @discardableResult
  open func expectListOfSupportedProviders(_ block: @escaping () throws -> Promise<[SignInCalendarProvider]>) -> XCTestExpectation {
    self.expectationForListOfSupportedProviders = self.testCase.expectation(description: "CalendarService.listOfSupportedProviders")
    self.expectListOfSupportedProvidersBlock = block
    return self.expectationForListOfSupportedProviders!
  }

  open func listOfSupportedProviders() -> Promise<[SignInCalendarProvider]> {
    XCTAssertNotNil(self.expectationForListOfSupportedProviders)
    self.expectationForListOfSupportedProviders?.fulfill()
    do {
      return try self.expectListOfSupportedProvidersBlock()
    } catch {
      XCTFail("unexpecting thrown error: \(error.localizedDescription)")
      fatalError()
    }
  }
}
// sourcery:end
// sourcery:inline:SignInCalendarProvider.Mockgen
// MARK: - SignInCalendarProvider
open class SignInCalendarProviderMock: SignInCalendarProvider {

  private let testCase: XCTestCase

  public init(testCase: XCTestCase) {
    self.testCase = testCase
  }

  // MARK: signIn(email: String, password: String)

  private var expectationForSignInEmailPassword: XCTestExpectation?
  private var expectSignInEmailPasswordBlock: (String, String) throws -> Promise<CalendarProvider> = { _,_  in
    XCTFail("unexpected call to SignInCalendarProvider.signIn(email:password:)")
    fatalError()
  }

  @discardableResult
  open func expectSignInEmailPassword(_ block: @escaping (String, String) throws -> Promise<CalendarProvider>) -> XCTestExpectation {
    self.expectationForSignInEmailPassword = self.testCase.expectation(description: "SignInCalendarProvider.signIn(email:password:)")
    self.expectSignInEmailPasswordBlock = block
    return self.expectationForSignInEmailPassword!
  }

  open func signIn(email: String, password: String) -> Promise<CalendarProvider> {
    XCTAssertNotNil(self.expectationForSignInEmailPassword)
    self.expectationForSignInEmailPassword?.fulfill()
    do {
      return try self.expectSignInEmailPasswordBlock(email, password)
    } catch {
      XCTFail("unexpecting thrown error: \(error.localizedDescription)")
      fatalError()
    }
  }
}
// sourcery:end
