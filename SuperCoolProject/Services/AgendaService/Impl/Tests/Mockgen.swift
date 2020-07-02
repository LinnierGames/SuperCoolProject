import XCTest
import Promise
import AgendaService

// sourcery:inline:AgendaService.Mockgen
// MARK: - AgendaService
class AgendaServiceMock: AgendaService {

  private let testCase: XCTestCase

  init(testCase: XCTestCase) {
    self.testCase = testCase
  }

  // MARK: agenda(for date: Date)

  private var expectationForAgendaForDate: XCTestExpectation?
  private var expectAgendaForDateBlock: (Date) throws -> Promise<Agenda> = { _  in
    XCTFail("unexpected call to AgendaService.agenda(for:)")
    fatalError()
  }

  @discardableResult
  func expectAgendaForDate(_ block: @escaping (Date) throws -> Promise<Agenda>) -> XCTestExpectation {
    self.expectationForAgendaForDate = self.testCase.expectation(description: "AgendaService.agenda(for:)")
    self.expectAgendaForDateBlock = block
    return self.expectationForAgendaForDate!
  }

  func agenda(for date: Date) -> Promise<Agenda> {
    XCTAssertNotNil(self.expectationForAgendaForDate)
    self.expectationForAgendaForDate?.fulfill()
    do {
      return try self.expectAgendaForDateBlock(date)
    } catch {
      XCTFail("unexpecting thrown error: \(error.localizedDescription)")
      fatalError()
    }
  }
}
// sourcery:end
