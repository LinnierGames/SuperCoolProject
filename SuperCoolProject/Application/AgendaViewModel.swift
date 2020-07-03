import Foundation
import Combine
import AgendaService

class AgendaViewModel {
  let agendaService = injectAgendaService()

  func agenda(for date: Date) -> AnyPublisher<Agenda, Never> {
    let publisher = PassthroughSubject<Agenda, Never>()
    agendaService.agenda(for: date).then { agenda in
      publisher.send(agenda)
    }

    return publisher.eraseToAnyPublisher()
  }
}
