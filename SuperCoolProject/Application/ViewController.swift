//
//  ViewController.swift
//  SuperCoolProject
//
//  Created by Erick Sanchez on 7/1/20.
//  Copyright © 2020 Erick Sanchez. All rights reserved.
//

import UIKit

import CalendarService
import WeatherService
import AgendaService

import Combine

class AgendaViewController: UIViewController {
  private let agendaViewModel = AgendaViewModel()
  private var bag = Set<AnyCancellable>()

  override func viewDidLoad() {
    super.viewDidLoad()

    let today = Date()
    agendaViewModel.agenda(for: today)
      .sink(receiveValue: updateUI)
      .store(in: &bag)
  }

  private func updateUI(agenda: Agenda) {
    // update the ui with the given agenda
  }
}
