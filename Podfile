platform :ios, '13.0'

target 'SuperCoolProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'Promises'

  # Services
  target 'AgendaService' do
    inherit! :search_paths

    pod 'Promises'

    target 'AgendaServiceTests' do
    end
    target 'AgendaServiceMocks' do
      pod 'Sourcery'
    end
  end

  target 'CalendarService' do
    inherit! :search_paths

    pod 'Promises'

    target 'CalendarServiceTests' do
    end
    target 'CalendarServiceMocks' do
      pod 'Sourcery'
    end
  end

  target 'WeatherService' do
    inherit! :search_paths

    pod 'Promises'

    target 'WeatherServiceTests' do
    end
    target 'WeatherServiceMocks' do
      pod 'Sourcery'
    end
  end

  # Shared
  target 'TestUtil' do
    inherit! :search_paths

    pod 'Promises'
  end

  # App test targets
  target 'SuperCoolProjectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SuperCoolProjectUITests' do
    # Pods for testing
  end
end
