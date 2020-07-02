platform :ios, '13.0'

target 'SuperCoolProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for SuperCoolProject
  pod 'Promises'

  target 'SuperCoolProjectTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SuperCoolProjectUITests' do
    # Pods for testing
  end

  target 'CalendarService' do
    inherit! :search_paths

    pod 'Promises'

    target 'CalendarServiceTests' do
      # Removing this line will inherit the parent pods
      # inherit! :search_paths
    end
  end

end
