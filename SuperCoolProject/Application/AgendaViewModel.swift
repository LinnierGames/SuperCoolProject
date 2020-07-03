import Foundation
import Combine
import AgendaService

class AgendaViewModel {
  let agendaService = injectAgendaService()

  func agenda(for date: Date) -> AnyPublisher<Agenda, Never> {
    return agendaService.agenda(for: date)
  }
}
